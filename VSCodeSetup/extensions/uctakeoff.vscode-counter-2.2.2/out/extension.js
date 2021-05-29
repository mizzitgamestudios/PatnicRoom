'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
const path = require("path");
const LineCounter_1 = require("./LineCounter");
const Gitignore_1 = require("./Gitignore");
const JSONC = require("jsonc-parser");
const minimatch = require("minimatch");
const util_1 = require("util");
// import { debug } from 'console';
const EXTENSION_ID = 'uctakeoff.vscode-counter';
const EXTENSION_NAME = 'VSCodeCounter';
const CONFIGURATION_SECTION = 'VSCodeCounter';
const toZeroPadString = (num, fig) => num.toString().padStart(fig, '0');
const toLocalDateString = (date, delims = ['-', ' ', ':']) => {
    return `${date.getFullYear()}${delims[0]}${toZeroPadString(date.getMonth() + 1, 2)}${delims[0]}${toZeroPadString(date.getDate(), 2)}${delims[1]}`
        + `${toZeroPadString(date.getHours(), 2)}${delims[2]}${toZeroPadString(date.getMinutes(), 2)}${delims[2]}${toZeroPadString(date.getSeconds(), 2)}`;
};
const toStringWithCommas = (obj) => {
    if (typeof obj === 'number') {
        return new Intl.NumberFormat('en-US').format(obj);
    }
    else {
        return obj.toString();
    }
};
const log = (message, ...items) => console.log(`[${EXTENSION_NAME}] ${new Date().toISOString()} ${message}`, ...items);
const showError = (message, ...items) => vscode.window.showErrorMessage(`[${EXTENSION_NAME}] ${message}`, ...items);
// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
function activate(context) {
    var _a, _b;
    const version = (_b = (_a = vscode.extensions.getExtension(EXTENSION_ID)) === null || _a === void 0 ? void 0 : _a.packageJSON) === null || _b === void 0 ? void 0 : _b.version;
    log(`${EXTENSION_ID} ver.${version} now active! : ${context.extensionPath}`);
    const codeCountController = new CodeCounterController();
    context.subscriptions.push(codeCountController, vscode.commands.registerCommand('extension.vscode-counter.countInWorkspace', () => codeCountController.countLinesInWorkSpace()), vscode.commands.registerCommand('extension.vscode-counter.countInDirectory', (targetDir) => codeCountController.countLinesInDirectory(targetDir)), vscode.commands.registerCommand('extension.vscode-counter.countInFile', () => codeCountController.toggleVisible()), vscode.commands.registerCommand('extension.vscode-counter.saveLanguageConfigurations', () => codeCountController.saveLanguageConfigurations()), vscode.commands.registerCommand('extension.vscode-counter.outputAvailableLanguages', () => codeCountController.outputAvailableLanguages()));
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
async function currentWorkspaceFolder() {
    var _a;
    const folders = (_a = vscode.workspace.workspaceFolders) !== null && _a !== void 0 ? _a : [];
    if (folders.length <= 0) {
        return undefined;
    }
    else if (folders.length === 1) {
        return folders[0];
    }
    else {
        return await vscode.window.showWorkspaceFolderPick();
    }
}
class CodeCounterController {
    constructor() {
        this.codeCounter_ = null;
        this.statusBarItem = null;
        this.outputChannel = null;
        // subscribe to selection change and editor activation events
        let subscriptions = [];
        vscode.window.onDidChangeActiveTextEditor(this.onDidChangeActiveTextEditor, this, subscriptions);
        vscode.window.onDidChangeTextEditorSelection(this.onDidChangeTextEditorSelection, this, subscriptions);
        vscode.workspace.onDidChangeConfiguration(this.onDidChangeConfiguration, this, subscriptions);
        vscode.workspace.onDidChangeTextDocument(this.onDidChangeTextDocument, this, subscriptions);
        // vscode.workspace.onDidChangeWorkspaceFolders(this.onDidChangeWorkspaceFolders, this, subscriptions);
        // create a combined disposable from both event subscriptions
        this.disposable = vscode.Disposable.from(...subscriptions);
    }
    dispose() {
        var _a, _b;
        (_a = this.statusBarItem) === null || _a === void 0 ? void 0 : _a.dispose();
        this.statusBarItem = null;
        (_b = this.outputChannel) === null || _b === void 0 ? void 0 : _b.dispose();
        this.outputChannel = null;
        this.disposable.dispose();
        this.codeCounter_ = null;
    }
    // private onDidChangeWorkspaceFolders(e: vscode.WorkspaceFoldersChangeEvent) {
    //     log(`onDidChangeWorkspaceFolders()`);
    //     // e.added.forEach((f) =>   log(` added   [${f.index}] ${f.name} : ${f.uri}`));
    //     // e.removed.forEach((f) => log(` removed [${f.index}] ${f.name} : ${f.uri}`));
    //     // vscode.workspace.workspaceFolders?.forEach((f) => log(` [${f.index}] ${f.name} : ${f.uri}`));
    // }
    onDidChangeActiveTextEditor(e) {
        if (this.codeCounter_) {
            // log(`onDidChangeActiveTextEditor(${!e ? 'undefined' : e.document.uri})`);
            this.countLinesInEditor(e);
        }
    }
    onDidChangeTextEditorSelection(e) {
        if (this.codeCounter_) {
            // log(`onDidChangeTextEditorSelection(${e.selections.length}selections, ${e.selections[0].isEmpty} )`, e.selections[0]);
            this.countLinesInEditor(e.textEditor);
        }
    }
    onDidChangeTextDocument(e) {
        if (this.codeCounter_) {
            // log(`onDidChangeTextDocument(${e.document.uri})`);
            this.countLinesOfFile(e.document);
        }
    }
    onDidChangeConfiguration() {
        // log(`onDidChangeConfiguration()`);
        this.codeCounter_ = null;
        this.countLinesInEditor(vscode.window.activeTextEditor);
    }
    toggleVisible() {
        if (!this.statusBarItem) {
            this.statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left);
            this.countLinesInEditor(vscode.window.activeTextEditor);
        }
        else {
            this.statusBarItem.dispose();
            this.statusBarItem = null;
        }
    }
    async getCodeCounter() {
        if (this.codeCounter_) {
            return this.codeCounter_;
        }
        const langs = await loadLanguageConfigurations();
        log(`load Language Settings = ${langs.size}`);
        await collectLanguageConfigurations(langs);
        log(`collect Language Settings = ${langs.size}`);
        const filesConf = vscode.workspace.getConfiguration("files", null);
        this.codeCounter_ = new LineCounterTable(langs, Object.entries(filesConf.get('associations', {})));
        //this.saveLanguageConfigurations(langs);
        return this.codeCounter_;
    }
    saveLanguageConfigurations() {
        this.getCodeCounter()
            .then(c => saveLanguageConfigurations(c.entries()))
            .catch(reason => showError(`saveLanguageConfigurations() failed.`, reason));
    }
    outputAvailableLanguages() {
        this.getCodeCounter().then(c => {
            c.entries().forEach((lang, id) => {
                this.toOutputChannel(`${id} : aliases[${lang.aliases}], extensions[${lang.extensions}], filenames:[${lang.filenames}]`);
            });
            this.toOutputChannel(`VS Code Counter : available all ${c.entries().size} languages.`);
        })
            .catch(reason => showError(`outputAvailableLanguages() failed.`, reason));
    }
    async countLinesInDirectory(targetDir) {
        try {
            const folder = await currentWorkspaceFolder();
            if (!folder) {
                showError(`No open workspace`);
            }
            else if (targetDir) {
                this.countLinesInDirectory_(targetDir, folder.uri);
            }
            else {
                const option = {
                    value: folder.uri.toString(true),
                    placeHolder: "Input Directory Path",
                    prompt: "Input Directory Path. "
                };
                const uri = await vscode.window.showInputBox(option);
                if (uri) {
                    this.countLinesInDirectory_(vscode.Uri.parse(uri), folder.uri);
                }
            }
        }
        catch (e) {
            showError(`countLinesInDirectory() failed.`, e.message);
        }
    }
    async countLinesInWorkSpace() {
        try {
            const folder = await currentWorkspaceFolder();
            if (folder) {
                this.countLinesInDirectory_(folder.uri, folder.uri);
            }
            else {
                showError(`No folder are open.`);
            }
        }
        catch (e) {
            showError(`countLinesInWorkSpace() failed.`, e.message);
        }
    }
    async countLinesInDirectory_(targetUri, workspaceDir) {
        const date = new Date();
        const conf = vscode.workspace.getConfiguration(CONFIGURATION_SECTION);
        const confFiles = vscode.workspace.getConfiguration("files", null);
        const outputDir = buildUri(workspaceDir, conf.get('outputDirectory', '.VSCodeCounter'));
        const includes = conf.get('include', ['**/*']);
        const excludes = conf.get('exclude', []);
        if (conf.get('useFilesExclude', true)) {
            excludes.push(...Object.keys(confFiles.get('exclude', {})));
        }
        excludes.push(vscode.workspace.asRelativePath(outputDir));
        const encoding = confFiles.get('encoding', 'utf8');
        const useGitignore = conf.get('useGitignore', true);
        const targetFiles = await findTargetFiles(targetUri, `{${includes.join(',')}}`, `{${excludes.join(',')}}`, useGitignore);
        const counter = await this.getCodeCounter();
        const ignoreUnsupportedFile = conf.get('ignoreUnsupportedFile', true);
        const results = await countLines(counter, targetFiles, encoding, ignoreUnsupportedFile, this.toOutputChannel);
        if (results.length <= 0) {
            showError(`There was no target file.`);
            return;
        }
        const historyCount = conf.get('history', 5);
        if (historyCount > 0) {
            await outputResults(date, targetUri, results, buildUri(outputDir, toLocalDateString(date, ['-', '_', '-'])), conf);
            const regex = /^\d\d\d\d-\d\d-\d\d\_\d\d-\d\d-\d\d$/;
            const outputSubDirs = (await vscode.workspace.fs.readDirectory(outputDir))
                .filter(d => ((d[1] & vscode.FileType.Directory) != 0) && regex.test(d[0]))
                .map(d => d[0])
                .sort();
            if (outputSubDirs.length > historyCount) {
                outputSubDirs.length -= historyCount;
                outputSubDirs.forEach(dirname => vscode.workspace.fs.delete(buildUri(outputDir, dirname), { recursive: true }));
            }
        }
        else {
            await outputResults(date, targetUri, results, outputDir, conf);
        }
        log(` finished. ${(new Date().getTime() - date.getTime())}ms`);
    }
    countLinesInEditor(editor) {
        const doc = editor === null || editor === void 0 ? void 0 : editor.document;
        if (!editor || !doc) {
            this.showStatusBar(`${EXTENSION_NAME}:Unsupported`);
        }
        else if (editor.selection.isEmpty) {
            this.countLinesOfFile(doc);
        }
        else {
            this.getCodeCounter().then(c => {
                const lineCounter = c.getById(doc.languageId) || c.getByUri(doc.uri);
                if (lineCounter) {
                    const result = editor.selections
                        .map(s => lineCounter.count(doc.getText(s)))
                        .reduce((prev, cur) => {
                        return {
                            code: prev.code + cur.code,
                            comment: prev.comment + cur.comment,
                            blank: prev.blank + cur.blank,
                        };
                    }, { code: 0, comment: 0, blank: 0 });
                    this.showStatusBar(`Selected Code:${result.code} Comment:${result.comment} Blank:${result.blank}`);
                }
                else {
                    this.showStatusBar(`${EXTENSION_NAME}:Unsupported`);
                }
            });
        }
    }
    countLinesOfFile(doc) {
        if (!doc) {
            this.showStatusBar(`${EXTENSION_NAME}:Unsupported`);
        }
        else {
            this.getCodeCounter().then(c => {
                const lineCounter = c.getById(doc.languageId) || c.getByUri(doc.uri);
                if (lineCounter) {
                    const result = lineCounter === null || lineCounter === void 0 ? void 0 : lineCounter.count(doc.getText());
                    this.showStatusBar(`Code:${result.code} Comment:${result.comment} Blank:${result.blank}`);
                }
                else {
                    this.showStatusBar(`${EXTENSION_NAME}:Unsupported`);
                }
            });
        }
    }
    showStatusBar(text) {
        if (this.statusBarItem) {
            this.statusBarItem.show();
            this.statusBarItem.text = text;
        }
    }
    toOutputChannel(text) {
        if (!this.outputChannel) {
            this.outputChannel = vscode.window.createOutputChannel(EXTENSION_NAME);
        }
        this.outputChannel.show();
        this.outputChannel.appendLine(text);
    }
}
const encodingTable = new Map([
    ['big5hkscs', 'big5-hkscs'],
    // ['cp437',        ''],
    // ['cp850',        ''],
    // ['cp852',        ''],
    // ['cp865',        ''],
    // ['cp866',        ''],
    // ['cp950',        ''],
    ['eucjp', 'euc-jp'],
    ['euckr', 'euc-kr'],
    // ['gb18030',      ''],
    // ['gb2312',       ''],
    // ['gbk',          ''],
    // ['iso88591',     ''],
    // ['iso885910',    ''],
    // ['iso885911',    ''],
    // ['iso885913',    ''],
    // ['iso885914',    ''],
    // ['iso885915',    ''],
    // ['iso88592',     ''],
    // ['iso88593',     ''],
    // ['iso88594',     ''],
    // ['iso88595',     ''],
    // ['iso88596',     ''],
    // ['iso88597',     ''],
    // ['iso88598',     ''],
    // ['iso88599',     ''],
    ['iso885916', 'iso-8859-16'],
    ['koi8r', 'koi8-r'],
    ['koi8ru', 'koi8-ru'],
    ['koi8t', 'koi8-t'],
    ['koi8u', 'koi8-u'],
    ['macroman', 'x-mac-roman'],
    ['shiftjis', 'shift-jis'],
    ['utf16be', 'utf-16be'],
    ['utf16le', 'utf-16le'],
    // ['utf8',         ''],
    ['utf8bom', 'utf8'],
    ['windows1250', 'windows-1250'],
    ['windows1251', 'windows-1251'],
    ['windows1252', 'windows-1252'],
    ['windows1253', 'windows-1253'],
    ['windows1254', 'windows-1254'],
    ['windows1255', 'windows-1255'],
    ['windows1256', 'windows-1256'],
    ['windows1257', 'windows-1257'],
    ['windows1258', 'windows-1258'],
    ['windows874', 'windows-874'],
]);
const buildUri = (uri, filename) => uri.with({ path: `${uri.path}/${filename}` });
const dirUri = (uri) => uri.with({ path: path.dirname(uri.path) });
function readFileAll(fileUris) {
    const ret = [];
    return new Promise((resolve, reject) => {
        if (fileUris.length > 0) {
            fileUris.forEach(fileUri => {
                vscode.workspace.fs.readFile(fileUri).then(data => {
                    log(`readfile : ${fileUri} : ${data.length}B`);
                    ret.push({ uri: fileUri, data: data });
                    if (ret.length === fileUris.length) {
                        resolve(ret);
                    }
                }, (reason) => {
                    log(`readfile : ${fileUri} : error ${reason}`);
                    ret.push({ uri: fileUri, data: null, error: reason });
                    if (ret.length === fileUris.length) {
                        resolve(ret);
                    }
                });
            });
        }
        else {
            resolve(ret);
        }
    });
}
function findTargetFiles(targetUri, include, exclude, useGitignore) {
    log(`includes : "${include}"`);
    log(`excludes : "${exclude}"`);
    const decoderU8 = new util_1.TextDecoder('utf8');
    return new Promise((resolve, reject) => {
        vscode.workspace.findFiles(include, exclude).then((files) => {
            const fileUris = files.filter(uri => !path.relative(targetUri.path, uri.path).startsWith(".."));
            if (useGitignore) {
                log(`target : ${fileUris.length} files -> use .gitignore`);
                vscode.workspace.findFiles('**/.gitignore', '').then((gitignoreFiles) => {
                    gitignoreFiles.forEach(f => log(`use gitignore : ${f}`));
                    readFileAll(gitignoreFiles.sort()).then((values) => {
                        const gitignores = new Gitignore_1.default('').merge(...values.map(p => new Gitignore_1.default(decoderU8.decode(p.data), dirUri(p.uri).fsPath)));
                        resolve(fileUris.filter(p => gitignores.excludes(p.fsPath)));
                    }, reject);
                }, reject);
            }
            else {
                resolve(fileUris);
            }
        });
    });
}
function countLines(lineCounterTable, fileUris, fileEncoding, ignoreUnsupportedFile, consoleOut) {
    log(`countLines : target ${fileUris.length} files`);
    return new Promise((resolve, reject) => {
        const results = [];
        if (fileUris.length <= 0) {
            resolve(results);
        }
        const decoder = new util_1.TextDecoder(encodingTable.get(fileEncoding) || fileEncoding);
        let fileCount = 0;
        fileUris.forEach(fileUri => {
            const lineCounter = lineCounterTable.getByUri(fileUri);
            if (lineCounter) {
                vscode.workspace.fs.readFile(fileUri).then(data => {
                    ++fileCount;
                    try {
                        results.push(new Result(fileUri, lineCounter.name, lineCounter.count(decoder.decode(data))));
                    }
                    catch (e) {
                        consoleOut(`"${fileUri}" Read Error : ${e.message}.`);
                        results.push(new Result(fileUri, '(Read Error)'));
                    }
                    if (fileCount === fileUris.length) {
                        resolve(results);
                    }
                }, (reason) => {
                    consoleOut(`"${fileUri}" Read Error : ${reason}.`);
                    results.push(new Result(fileUri, '(Read Error)'));
                });
            }
            else {
                if (!ignoreUnsupportedFile) {
                    results.push(new Result(fileUri, '(Unsupported)'));
                }
                ++fileCount;
                if (fileCount === fileUris.length) {
                    resolve(results);
                }
            }
        });
    });
}
function pushUnique(array, ...values) {
    values.forEach(value => {
        if (array.indexOf(value) < 0) {
            array.push(value);
        }
    });
}
const append = (langs, l) => {
    var _a, _b, _c;
    const langExt = getOrSet(langs, l.id, () => {
        return {
            aliases: [],
            filenames: [],
            extensions: [],
            lineComments: [],
            blockComments: [],
            blockStrings: []
        };
    });
    // l.aliases?.filter(v => langExt.aliases.indexOf(v) < 0).forEach(v => langExt.aliases.push(v));
    // l.filenames?.filter(v => langExt.filenames.indexOf(v) < 0).forEach(v => langExt.filenames.push(v));
    // l.extensions?.filter(v => langExt.extensions.indexOf(v) < 0).forEach(v => langExt.extensions.push(v));
    pushUnique(langExt.aliases, ...((_a = l.aliases) !== null && _a !== void 0 ? _a : []));
    pushUnique(langExt.filenames, ...((_b = l.filenames) !== null && _b !== void 0 ? _b : []));
    pushUnique(langExt.extensions, ...((_c = l.extensions) !== null && _c !== void 0 ? _c : []));
    return langExt;
};
function collectLanguageConfigurations(langs) {
    return new Promise((resolve, reject) => {
        if (vscode.extensions.all.length <= 0) {
            resolve(langs);
        }
        else {
            let finishedCount = 0;
            let totalCount = 0;
            const decoderU8 = new util_1.TextDecoder('utf8');
            vscode.extensions.all.forEach(ex => {
                var _a, _b;
                const languages = (_b = (_a = ex.packageJSON.contributes) === null || _a === void 0 ? void 0 : _a.languages) !== null && _b !== void 0 ? _b : undefined;
                if (languages) {
                    totalCount += languages.length;
                    languages.forEach(l => {
                        const langExt = append(langs, l);
                        if (l.configuration) {
                            const confUrl = vscode.Uri.file(path.join(ex.extensionPath, l.configuration));
                            vscode.workspace.fs.readFile(confUrl).then(data => {
                                // log(`${confUrl} ${data.length}B :${l.id}`);
                                const langConf = JSONC.parse(decoderU8.decode(data));
                                if (langConf.comments) {
                                    if (langConf.comments.lineComment) {
                                        pushUnique(langExt.lineComments, langConf.comments.lineComment);
                                    }
                                    if (langConf.comments.blockComment && langConf.comments.blockComment.length >= 2) {
                                        pushUnique(langExt.blockComments, langConf.comments.blockComment);
                                    }
                                }
                                if (++finishedCount >= totalCount) {
                                    resolve(langs);
                                }
                            }, (reason) => {
                                log(`${confUrl} : error ${reason}`);
                                if (++finishedCount >= totalCount) {
                                    resolve(langs);
                                }
                            });
                        }
                        else {
                            if (++finishedCount >= totalCount) {
                                resolve(langs);
                            }
                        }
                    });
                }
            });
        }
    });
}
function saveLanguageConfigurations_(langs) {
    const conf = vscode.workspace.getConfiguration(CONFIGURATION_SECTION);
    const saveLocation = conf.get('saveLocation', 'global settings');
    if (saveLocation === "global settings") {
        conf.update('languages', langs, vscode.ConfigurationTarget.Global);
    }
    else if (saveLocation === "workspace settings") {
        conf.update('languages', langs, vscode.ConfigurationTarget.Workspace);
    }
    else if (saveLocation === "output directory") {
        currentWorkspaceFolder().then(async (folder) => {
            if (!folder)
                return;
            const outputDirUri = buildUri(folder.uri, conf.get('outputDirectory', '.VSCodeCounter'));
            const uri = buildUri(outputDirUri, 'languages.json');
            await makeDirectories(outputDirUri);
            writeTextFile(uri, JSON.stringify(langs));
        });
    }
}
function saveLanguageConfigurations(langs) {
    saveLanguageConfigurations_(mapToObject(langs));
}
async function loadLanguageConfigurations_() {
    const conf = vscode.workspace.getConfiguration(CONFIGURATION_SECTION);
    const saveLocation = conf.get('saveLocation', 'global settings');
    if (saveLocation === "global settings") {
        return conf.get('languages', {});
    }
    else if (saveLocation === "workspace settings") {
        return conf.get('languages', {});
    }
    else if (saveLocation === "output directory") {
        const workFolder = await currentWorkspaceFolder();
        if (!workFolder)
            return {};
        const outputDirUri = buildUri(workFolder.uri, conf.get('outputDirectory', '.VSCodeCounter'));
        const uri = buildUri(outputDirUri, 'languages.json');
        const data = await vscode.workspace.fs.readFile(uri);
        const decoderU8 = new util_1.TextDecoder('utf8');
        return JSONC.parse(decoderU8.decode(data));
    }
    else {
        return {};
    }
}
async function loadLanguageConfigurations() {
    return objectToMap(await loadLanguageConfigurations_());
}
class LineCounterTable {
    constructor(langExtensions, associations) {
        this.entries = () => this.langExtensions;
        this.langExtensions = langExtensions;
        this.langIdTable = new Map();
        this.aliasTable = new Map();
        this.fileextRules = new Map();
        this.filenameRules = new Map();
        this.associations = associations;
        log(`associations : ${this.associations.length}\n[${this.associations.join("],[")}]`);
        langExtensions.forEach((lang, id) => {
            const langName = lang.aliases.length > 0 ? lang.aliases[0] : id;
            const lineCounter = new LineCounter_1.default(langName, lang.lineComments, lang.blockComments, lang.blockStrings);
            lang.aliases.forEach(v => this.aliasTable.set(v, lineCounter));
            lang.extensions.forEach(v => this.fileextRules.set(v.startsWith('.') ? v : `.${v}`, lineCounter));
            lang.filenames.forEach(v => this.filenameRules.set(v, lineCounter));
        });
    }
    getById(langId) {
        return this.langIdTable.get(langId) || this.aliasTable.get(langId);
    }
    getByPath(filePath) {
        const lineCounter = this.fileextRules.get(filePath) || this.fileextRules.get(path.extname(filePath)) || this.filenameRules.get(path.basename(filePath));
        if (lineCounter !== undefined) {
            return lineCounter;
        }
        const patType = this.associations.find(([pattern,]) => minimatch(filePath, pattern, { matchBase: true }));
        //log(`## ${filePath}: ${patType}`);
        return (patType !== undefined) ? this.getById(patType[1]) : undefined;
    }
    getByUri(uri) {
        return this.getByPath(uri.fsPath);
    }
}
async function outputResults(date, workspaceUri, results, outputDirUri, conf) {
    const resultTable = new ResultTable(workspaceUri, results, conf.get('printNumberWithCommas', true) ? toStringWithCommas : (obj) => obj.toString());
    const endOfLine = conf.get('endOfLine', '\n');
    log(`count ${results.length} files`);
    const previewType = conf.get('outputPreviewType', '');
    log(`OutputDir : ${outputDirUri}`);
    await makeDirectories(outputDirUri);
    if (conf.get('outputAsText', true)) {
        const resultsUri = buildUri(outputDirUri, 'results.txt');
        const promise = writeTextFile(resultsUri, resultTable.toTextLines(date).join(endOfLine));
        if (previewType === 'text') {
            promise.then(() => showTextFile(resultsUri)).catch(err => showError(`failed to output text.`, err));
        }
        else {
            promise.catch(err => showError(`failed to output text.`, err));
        }
    }
    if (conf.get('outputAsCSV', true)) {
        const resultsUri = buildUri(outputDirUri, 'results.csv');
        const promise = writeTextFile(resultsUri, resultTable.toCSVLines().join(endOfLine));
        if (previewType === 'csv') {
            promise.then(() => showTextFile(resultsUri)).catch(err => showError(`failed to output csv.`, err));
        }
        else {
            promise.catch(err => showError(`failed to output csv.`, err));
        }
    }
    if (conf.get('outputAsMarkdown', true)) {
        const detailsUri = buildUri(outputDirUri, 'details.md');
        const resultsUri = buildUri(outputDirUri, 'results.md');
        const promise = conf.get('outputMarkdownSeparately', true)
            ? writeTextFile(detailsUri, [
                '# Details',
                '',
                ...resultTable.toMarkdownHeaderLines(date),
                '',
                `[summary](results.md)`,
                '',
                ...resultTable.toMarkdownDetailsLines(),
                '',
                `[summary](results.md)`,
            ].join(endOfLine)).then(() => writeTextFile(resultsUri, [
                '# Summary',
                '',
                ...resultTable.toMarkdownHeaderLines(date),
                '',
                `[details](details.md)`,
                '',
                ...resultTable.toMarkdownSummaryLines(),
                '',
                `[details](details.md)`
            ].join(endOfLine)))
            : writeTextFile(resultsUri, [
                ...resultTable.toMarkdownHeaderLines(date),
                '',
                ...resultTable.toMarkdownSummaryLines(),
                '',
                ...resultTable.toMarkdownDetailsLines(),
            ].join(endOfLine));
        if (previewType === 'markdown') {
            promise.then(() => vscode.commands.executeCommand("markdown.showPreview", resultsUri))
                .catch(err => showError(`failed to output markdown text.`, err));
        }
        else {
            promise.catch(err => showError(`failed to output markdown text.`, err));
        }
    }
}
class Result {
    constructor(uri, language, value = { code: -1, comment: 0, blank: 0 }) {
        this.code = 0;
        this.comment = 0;
        this.blank = 0;
        this.uri = uri;
        this.filename = uri.fsPath;
        this.language = language;
        this.code = value.code;
        this.comment = value.comment;
        this.blank = value.blank;
    }
    get total() {
        return this.code + this.comment + this.blank;
    }
}
class Statistics {
    constructor(name) {
        this.files = 0;
        this.code = 0;
        this.comment = 0;
        this.blank = 0;
        this.name = name;
    }
    get total() {
        return this.code + this.comment + this.blank;
    }
    append(result) {
        this.files++;
        this.code += result.code;
        this.comment += result.comment;
        this.blank += result.blank;
        return this;
    }
}
class MarkdownTableFormatter {
    constructor(valueToString, ...columnInfo) {
        this.valueToString = valueToString;
        this.columnInfo = columnInfo;
    }
    get lineSeparator() {
        return '| ' + this.columnInfo.map(i => (i.format === 'number') ? '---:' : ':---').join(' | ') + ' |';
    }
    get headerLines() {
        return ['| ' + this.columnInfo.map(i => i.title).join(' | ') + ' |', this.lineSeparator];
    }
    line(...data) {
        return '| ' + data.map((d, i) => {
            if (typeof d === 'number') {
                return this.valueToString(d);
            }
            if (typeof d === 'string') {
                return d;
            }
            const relativePath = vscode.workspace.asRelativePath(d);
            return `[${relativePath}](/${relativePath})`;
        }).join(' | ') + ' |';
    }
}
class ResultTable {
    constructor(workspaceUri, results, valueToString = (obj) => obj.toString()) {
        this.fileResults = [];
        this.dirResultTable = new Map();
        this.langResultTable = new Map();
        this.total = new Statistics('Total');
        this.targetDirPath = workspaceUri.fsPath;
        this.fileResults = results;
        this.valueToString = valueToString;
        results
            .filter((result) => result.code >= 0)
            .forEach((result) => {
            let parent = path.dirname(path.relative(this.targetDirPath, result.filename));
            while (parent.length >= 0) {
                getOrSet(this.dirResultTable, parent, () => new Statistics(parent)).append(result);
                const p = path.dirname(parent);
                if (p === parent) {
                    break;
                }
                parent = p;
            }
            getOrSet(this.langResultTable, result.language, () => new Statistics(result.language)).append(result);
            this.total.append(result);
        });
    }
    /*
        public toCSVLines() {
            const languages = [...this.langResultTable.keys()];
            return [
                `filename, language, ${languages.join(', ')}, comment, blank, total`,
                ...this.fileResults.sort((a,b) => a.filename < b.filename ? -1 : a.filename > b.filename ? 1 : 0)
                    .map(v => `${v.filename}, ${v.language}, ${languages.map(l => l === v.language ? v.code : 0).join(', ')}, ${v.comment}, ${v.blank}, ${v.total}`),
                `Total, -, ${[...this.langResultTable.values()].map(r => r.code).join(', ')}, ${this.total.comment}, ${this.total.blank}, ${this.total.total}`
            ];
        }
    */
    toCSVLines() {
        const languages = [...this.langResultTable.keys()];
        return [
            `"filename", "language", "${languages.join('", "')}", "comment", "blank", "total"`,
            ...this.fileResults.sort((a, b) => a.filename < b.filename ? -1 : a.filename > b.filename ? 1 : 0)
                .map(v => `"${v.filename}", "${v.language}", ${languages.map(l => l === v.language ? v.code : 0).join(', ')}, ${v.comment}, ${v.blank}, ${v.total}`),
            `"Total", "-", ${[...this.langResultTable.values()].map(r => r.code).join(', ')}, ${this.total.comment}, ${this.total.blank}, ${this.total.total}`
        ];
    }
    toTextLines(date) {
        class TextTableFormatter {
            constructor(valueToString, ...columnInfo) {
                this.valueToString = valueToString;
                this.columnInfo = columnInfo;
                for (const info of this.columnInfo) {
                    info.width = Math.max(info.title.length, info.width);
                }
            }
            get lineSeparator() {
                return '+-' + this.columnInfo.map(i => '-'.repeat(i.width)).join('-+-') + '-+';
            }
            get headerLines() {
                return [this.lineSeparator, '| ' + this.columnInfo.map(i => i.title.padEnd(i.width)).join(' | ') + ' |', this.lineSeparator];
            }
            get footerLines() {
                return [this.lineSeparator];
            }
            line(...data) {
                return '| ' + data.map((d, i) => {
                    if (typeof d === 'string') {
                        return d.padEnd(this.columnInfo[i].width);
                    }
                    else {
                        return this.valueToString(d).padStart(this.columnInfo[i].width);
                    }
                }).join(' | ') + ' |';
            }
        }
        const maxNamelen = Math.max(...this.fileResults.map(res => res.filename.length));
        const maxLanglen = Math.max(...[...this.langResultTable.keys()].map(l => l.length));
        const resultFormat = new TextTableFormatter(this.valueToString, { title: 'filename', width: maxNamelen }, { title: 'language', width: maxLanglen }, { title: 'code', width: 10 }, { title: 'comment', width: 10 }, { title: 'blank', width: 10 }, { title: 'total', width: 10 });
        const dirFormat = new TextTableFormatter(this.valueToString, { title: 'path', width: maxNamelen }, { title: 'files', width: 10 }, { title: 'code', width: 10 }, { title: 'comment', width: 10 }, { title: 'blank', width: 10 }, { title: 'total', width: 10 });
        const langFormat = new TextTableFormatter(this.valueToString, { title: 'language', width: maxLanglen }, { title: 'files', width: 10 }, { title: 'code', width: 10 }, { title: 'comment', width: 10 }, { title: 'blank', width: 10 }, { title: 'total', width: 10 });
        return [
            `Date : ${toLocalDateString(date)}`,
            `Directory : ${this.targetDirPath}`,
            // `Total : code: ${this.total.code}, comment : ${this.total.comment}, blank : ${this.total.blank}, all ${this.total.total} lines`,
            `Total : ${this.total.files} files,  ${this.total.code} codes, ${this.total.comment} comments, ${this.total.blank} blanks, all ${this.total.total} lines`,
            '',
            'Languages',
            ...langFormat.headerLines,
            ...[...this.langResultTable.values()].sort((a, b) => b.code - a.code)
                .map(v => langFormat.line(v.name, v.files, v.code, v.comment, v.blank, v.total)),
            ...langFormat.footerLines,
            '',
            'Directories',
            ...dirFormat.headerLines,
            ...[...this.dirResultTable.values()].sort((a, b) => a.name < b.name ? -1 : a.name > b.name ? 1 : 0)
                .map(v => dirFormat.line(v.name, v.files, v.code, v.comment, v.blank, v.total)),
            ...dirFormat.footerLines,
            '',
            'Files',
            ...resultFormat.headerLines,
            ...this.fileResults.sort((a, b) => a.filename < b.filename ? -1 : a.filename > b.filename ? 1 : 0)
                .map(v => resultFormat.line(v.filename, v.language, v.code, v.comment, v.blank, v.total)),
            resultFormat.line('Total', '', this.total.code, this.total.comment, this.total.blank, this.total.total),
            ...resultFormat.footerLines,
        ];
    }
    toMarkdownHeaderLines(date) {
        return [
            `Date : ${toLocalDateString(date)}`,
            '',
            `Directory ${this.targetDirPath}`,
            '',
            `Total : ${this.total.files} files,  ${this.total.code} codes, ${this.total.comment} comments, ${this.total.blank} blanks, all ${this.total.total} lines`,
        ];
    }
    toMarkdownSummaryLines() {
        const dirFormat = new MarkdownTableFormatter(this.valueToString, { title: 'path', format: 'string' }, { title: 'files', format: 'number' }, { title: 'code', format: 'number' }, { title: 'comment', format: 'number' }, { title: 'blank', format: 'number' }, { title: 'total', format: 'number' });
        const langFormat = new MarkdownTableFormatter(this.valueToString, { title: 'language', format: 'string' }, { title: 'files', format: 'number' }, { title: 'code', format: 'number' }, { title: 'comment', format: 'number' }, { title: 'blank', format: 'number' }, { title: 'total', format: 'number' });
        return [
            '## Languages',
            ...langFormat.headerLines,
            ...[...this.langResultTable.values()].sort((a, b) => b.code - a.code)
                .map(v => langFormat.line(v.name, v.files, v.code, v.comment, v.blank, v.total)),
            '',
            '## Directories',
            ...dirFormat.headerLines,
            ...[...this.dirResultTable.values()].sort((a, b) => a.name < b.name ? -1 : a.name > b.name ? 1 : 0)
                .map(v => dirFormat.line(v.name, v.files, v.code, v.comment, v.blank, v.total)),
        ];
    }
    toMarkdownDetailsLines() {
        const resultFormat = new MarkdownTableFormatter(this.valueToString, { title: 'filename', format: 'uri' }, { title: 'language', format: 'string' }, { title: 'code', format: 'number' }, { title: 'comment', format: 'number' }, { title: 'blank', format: 'number' }, { title: 'total', format: 'number' });
        return [
            '## Files',
            ...resultFormat.headerLines,
            ...this.fileResults.sort((a, b) => a.filename < b.filename ? -1 : a.filename > b.filename ? 1 : 0)
                .map(v => resultFormat.line(v.uri, v.language, v.code, v.comment, v.blank, v.total)),
        ];
    }
}
function mapToObject(map) {
    const obj = {};
    map.forEach((v, id) => {
        obj[id] = v;
    });
    return obj;
}
function objectToMap(obj) {
    return new Map(Object.entries(obj));
}
function getOrSet(map, key, otherwise) {
    let v = map.get(key);
    if (v === undefined) {
        v = otherwise();
        map.set(key, v);
    }
    return v;
}
function makeDirectories_(dirpath, resolve, reject) {
    // log(`makeDirectories ${dirpath}`);
    vscode.workspace.fs.stat(dirpath).then((fileStat) => {
        if ((fileStat.type & vscode.FileType.Directory) != 0) {
            resolve();
        }
        else {
            reject(`${dirpath} is not directory.`);
        }
    }, (reason) => {
        log(`vscode.workspace.fs.stat failed: ${reason}`);
        const curPath = dirpath.path;
        const parent = path.dirname(curPath);
        if (parent !== curPath) {
            makeDirectories_(dirpath.with({ path: parent }), () => {
                log(`vscode.workspace.fs.createDirectory ${dirpath}`);
                vscode.workspace.fs.createDirectory(dirpath).then(resolve, reject);
            }, reject);
        }
        else {
            reject(reason);
        }
    });
}
function makeDirectories(dirpath) {
    return new Promise((resolve, reject) => makeDirectories_(dirpath, resolve, reject));
}
function showTextFile(uri) {
    log(`showTextFile : ${uri}`);
    return new Promise((resolve, reject) => {
        vscode.workspace.openTextDocument(uri)
            .then((doc) => vscode.window.showTextDocument(doc, vscode.ViewColumn.One, true), reject)
            .then(resolve, reject);
    });
}
function writeTextFile(uri, text) {
    log(`writeTextFile : ${uri} ${text.length}B`);
    return new Promise((resolve, reject) => {
        vscode.workspace.fs.writeFile(uri, new util_1.TextEncoder().encode(text)).then(resolve, reject);
    });
}
//# sourceMappingURL=extension.js.map
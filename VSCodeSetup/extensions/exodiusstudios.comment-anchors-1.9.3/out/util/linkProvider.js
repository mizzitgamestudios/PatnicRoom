"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.setupLinkProvider = void 0;
const vscode_1 = require("vscode");
const flattener_1 = require("./flattener");
const path_1 = require("path");
const asyncDelay_1 = require("./asyncDelay");
const fs_1 = require("fs");
const entryAnchor_1 = require("../anchor/entryAnchor");
const LINK_REGEX = /^(\.{1,2}[/\\])?(.+?)(:\d+|#[\w-]+)?$/;
class LinkCodeLensProvider {
    constructor(engine) {
        this.engine = engine;
    }
    async provideCodeLenses(document) {
        var _a, _b, _c;
        if (document.uri.scheme == "output") {
            return [];
        }
        // While this seems like an extremely crude solution,
        // it does provide a much better visual experience
        // compared to directly parsing anchors.
        while (this.engine.anchorsDirty) {
            await asyncDelay_1.asyncDelay(100);
        }
        const index = this.engine.anchorMaps.get(document.uri);
        const list = [];
        if (!index) {
            return [];
        }
        const flattened = flattener_1.flattenAnchors(index.anchorTree);
        const basePath = path_1.join(document.uri.fsPath, "..");
        const workspacePath = (_c = (_b = (_a = vscode_1.workspace.getWorkspaceFolder(document.uri)) === null || _a === void 0 ? void 0 : _a.uri) === null || _b === void 0 ? void 0 : _b.fsPath) !== null && _c !== void 0 ? _c : "";
        flattened
            .filter((anchor) => {
            const tagId = anchor.anchorTag;
            const tag = this.engine.tags.get(tagId);
            return (tag === null || tag === void 0 ? void 0 : tag.behavior) == "link";
        })
            .forEach((anchor) => {
            var _a, _b, _c;
            const components = LINK_REGEX.exec(anchor.anchorText);
            const parameter = components[3] || "";
            const filePath = components[2];
            const relativeFolder = components[1];
            const fullPath = relativeFolder ? path_1.resolve(basePath, relativeFolder, filePath) : path_1.resolve(workspacePath, filePath);
            const fileUri = vscode_1.Uri.file(fullPath);
            const exists = fs_1.lstatSync(fullPath).isFile();
            if (exists) {
                let codeLens;
                if (parameter.startsWith(":")) {
                    const lineNumber = parseInt(parameter.substr(1)) - 1;
                    const options = {
                        uri: fileUri,
                        lineNumber: lineNumber,
                        at: entryAnchor_1.default.ScrollPosition,
                    };
                    codeLens = new vscode_1.CodeLens(anchor.lensRange, {
                        command: "commentAnchors.openFileAndRevealLine",
                        title: "$(chevron-right) Click here to open file at line " + (lineNumber + 1),
                        arguments: [options],
                    });
                }
                else {
                    if (parameter.startsWith("#")) {
                        const targetId = parameter.substr(1);
                        this.engine.revealAnchorOnParse = targetId;
                        if (fileUri.path == ((_c = (_b = (_a = vscode_1.window.activeTextEditor) === null || _a === void 0 ? void 0 : _a.document) === null || _b === void 0 ? void 0 : _b.uri) === null || _c === void 0 ? void 0 : _c.path)) {
                            const anchors = this.engine.currentAnchors;
                            const flattened = flattener_1.flattenAnchors(anchors);
                            let targetLine;
                            for (const anchor of flattened) {
                                if (anchor.attributes.id == targetId) {
                                    targetLine = anchor.lineNumber - 1;
                                }
                            }
                            const options = {
                                lineNumber: targetLine,
                                at: "top",
                            };
                            codeLens = new vscode_1.CodeLens(anchor.lensRange, {
                                command: "revealLine",
                                title: "$(chevron-right) Click here to go to anchor " + targetId,
                                arguments: [options],
                            });
                        }
                        else {
                            codeLens = new vscode_1.CodeLens(anchor.lensRange, {
                                command: "vscode.open",
                                title: "$(chevron-right) Click here to open file at anchor " + targetId,
                                arguments: [fileUri],
                            });
                        }
                    }
                    else {
                        codeLens = new vscode_1.CodeLens(anchor.lensRange, {
                            command: "vscode.open",
                            title: "$(chevron-right) Click here to open file",
                            arguments: [fileUri],
                        });
                    }
                }
                list.push(codeLens);
            }
            else {
                list.push(new vscode_1.CodeLens(anchor.lensRange, {
                    command: "",
                    title: "$(chrome-close) File not found",
                    arguments: [],
                }));
            }
        });
        return list;
    }
}
function setupLinkProvider(engine) {
    return vscode_1.languages.registerCodeLensProvider({ language: "*" }, new LinkCodeLensProvider(engine));
}
exports.setupLinkProvider = setupLinkProvider;
//# sourceMappingURL=linkProvider.js.map
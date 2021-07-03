use std::io;
use std::env;
use std::fs;
use std::fs::OpenOptions;
use std::process::Command;
use std::io::prelude::*;

use crossterm::style::*;

use std::io::{stdout, Write};
use crossterm::*;
use crossterm::style::*;
use crossterm::terminal::*;


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
pub fn maintain_window_format()-> Result<()>{execute!(stdout(), SetForegroundColor(Color::Green), SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),)?;Ok(())}

pub fn set_up(){
    let mut backup = [  "splt" , "splitting up master config into Workspace-configs",
                        "inst" , "inserting in-game texts of base edition",
                        "calc" , "calculating all stats",
                        "chek" , "Checks if current states are pushable"];

    print_red("---- DISTRIBUTION MENUE ----\n\r\n\r");
    print_entry(&backup[0], &backup[1]);
    print_entry(&backup[2], &backup[3]);
    print_entry(&backup[4], &backup[5]);
    print_entry(&backup[6], &backup[7]);

    

    print!("\r\n\r\n\r\n");
    for i in 0..120{print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:100 }))}
    print!("\r\n");
    change_to_submenue();
}


fn print_entry(input:&str,desc:&str){
    print_red(input);
    for i in 0..5-input.len(){print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:49 }))}
    print_green("> for   ");
    print_red(desc);
    print!("\r\n");
}


fn change_to_submenue(){
   // maintain_window_format();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}
    
    print_red("\r\n\r\n");
    match input.as_str() {
        "esc"  => print!(""),
        "splt" => proxy_split(),
        "calc" => calc(),
        "inst" => inst(),
        "chek" => chek(),
        _      => print!(""),
    }
   // maintain_window_format();
}



pub fn proxy_split(){split_changelog_and_readme();}
fn split_changelog_and_readme()-> io::Result<()>{
    print_chapter("Split Configs...");
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();

    let splitted_root: Vec<&str> = path.split("DevCLI\\Cargo").collect();
    let mut workspaces = splitted_root[0];
    


    let master_config          = format!("{}{}",workspaces,"DevCLI\\Parameter\\config_splitter_master.txt");
    let master_content         = fs::read_to_string(master_config.to_string()).expect("file not found");
    let splitted_txt:Vec<&str> = master_content.split("\n").collect();
    
    
    let mut path  = "N/A";
    for line in splitted_txt.iter(){
        let current_line = line.to_owned();
        let mut state = "write";


        if current_line.trim() == "[PatnicRoom]" { path = "PatnicRoom" ; state="pass";   } 
        if current_line.trim() == "[DioJSONes]"  { path = "DioJSONes"  ; state="pass";   } 
        if current_line.trim() == "[GameData]"   { path = "GameData"   ; state="pass";   } 
        if current_line.trim() == "[Webside]"    { path = "Webside"    ; state="pass";   } 


        let changelog_path = format!("{}{}{}",workspaces,path,"\\Meta\\Changelog.txt");
        


        if state == "pass"{
            print_red("\r\n\r\n======================================================================\r\n|");
            print_green("space");
            print_red("|     ");
            print!("{}",path.bold().italic().on(Color::Rgb { r:21,g:27,b:49 }).green());
            for i in 0..57-path.len(){  print_green(" ")  }
            print_red("|\r\n======================================================================\r\n");
            maintain_window_format();
        }



        if state == "write" {
            print_red("|");
            print_green("entry");
            print_red("|");
            let output = format!(" {}",current_line);
            print_green(&output);

            for i in 0..50-current_line.len(){  print_green(" ")  }

            print_red("|");
            let output = format!("{}", path);
            print_green(&output);
            for i in 0..10-path.len(){  print!(" ")  }

            print_red("|\r\n----------------------------------------------------------------------\r\n");
            
            let mut file  = OpenOptions::new().write(true).append(true).open(changelog_path).unwrap();
            if let Err(e) = writeln!(file, "{}", current_line) {eprintln!("Couldn't write to file: {}", e);}
        }


    }

    let path                     = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_path: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let root                     = splitted_path[0];

    let filepath_old = format!("{}Workspaces\\DevCLI\\Parameter\\Basegame_Changelog.txt",root);
    fs::copy(master_config, filepath_old);



    let config_path = format!("{}{}",workspaces,"DevCLI\\Parameter\\config_splitter_master.txt");
    let form        = format!
(
"[PatnicRoom]
<player>
<modder>
<developer>
[DioJSONes]
[GameData]
[Webside]"
);
    fs::remove_file(config_path.as_str());
    fs::write(config_path.as_str(), form);
    
    Ok(())
}




pub fn calc(){
    let path                     = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_path: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let root                     = splitted_path[0];
    let output                   = format!("{}Workspaces\\PatnicRoom\\tools\\Statistics\\output",root);


    print_green("current Directory:  ");
    print_red(&path);
    

    print_chapter("building Filepaths...");
    calc_build_filepaths(get_all_atlas_names(),&output);


    print_chapter("Starts PatnicRoom...");
    calc_start_patnicroom(&root);
    

    print_chapter("Distributes Markdowns...");
    calc_distribute_markdown(get_all_atlas_names(),&output,&root)
}


fn calc_build_filepaths(atlas_to_sync:Vec<&str>, output:&str){
    fs::create_dir(output);

    for current_dir in atlas_to_sync.iter(){
        let mut filepath_to_copy  = format!("{}\\Atlas_{}.md", output,current_dir);

        print_copy_paste(current_dir);
        fs::write(filepath_to_copy,"");
    }
    let mut filepath_to_copy  = format!("{}\\components.json", output);
    print_copy_paste("components.json");
    fs::write(filepath_to_copy,"");

    let mut filepath_to_copy  = format!("{}\\Syntax Components.md", output);
    print_copy_paste("Syntax Components");
    fs::write(filepath_to_copy,"");

    let mut filepath_to_copy  = format!("{}\\Syntax Components.json", output);
    print_copy_paste("Syntax Components");
    fs::write(filepath_to_copy,"");
}
fn calc_start_patnicroom(root:&str){
    let gameinit_file = format!("{}Workspaces\\PatnicRoom\\tools\\gameinit.txt",root);
    let cached_gameinit = fs::read_to_string(gameinit_file).expect("file not found");

    let gameinit_file = format!("{}Workspaces\\PatnicRoom\\tools\\gameinit.txt",root);
    fs::remove_file(gameinit_file);
    let gameinit_file = format!("{}Workspaces\\PatnicRoom\\tools\\gameinit.txt",root);
    fs::write(gameinit_file, "statistics");

    
    let sh_directory = format!("{}Workspaces\\DevCLI",root);
    env::set_current_dir(&sh_directory).is_ok();
    print!("{}", sh_directory);
    Command::new("sh").arg("startPatnicRoom.sh").status().expect(" ");

    let gameinit_file = format!("{}Workspaces\\PatnicRoom\\tools\\gameinit.txt",root);
    fs::remove_file(gameinit_file);
    let gameinit_file = format!("{}Workspaces\\PatnicRoom\\tools\\gameinit.txt",root);
    fs::write(gameinit_file,cached_gameinit);
}
fn calc_distribute_markdown(atlas_to_sync:Vec<&str>, output:&str, root:&str){
    for current_dir in atlas_to_sync.iter(){
        let mut filepath_to_copy  = format!("{}\\Atlas_{}.md", output,current_dir);
        let mut filepath_to_paste = format!("{}docs\\docs\\Atlas\\Atlas_{}.md",root,current_dir);

        print_copy_paste(current_dir);
        fs::copy(filepath_to_copy,filepath_to_paste);
    }

    let mut filepath_to_copy  = format!("{}\\components.json", output);
    let mut filepath_to_paste = format!("{}docs\\docs\\Atlas\\components.json",root);
    print_copy_paste("components.json");
    fs::copy(filepath_to_copy,filepath_to_paste);


    let mut filepath_to_copy  = format!("{}\\Syntax Components.md", output);
    let mut filepath_to_paste = format!("{}docs\\docs\\Syntax\\Syntax Components.md",root);
    print_copy_paste("Syntax Components");
    fs::copy(filepath_to_copy,filepath_to_paste);


    let mut filepath_to_copy  = format!("{}\\Syntax Components.json", output);
    let mut filepath_to_paste = format!("{}docs\\docs\\Syntax\\Syntax Components.json",root);
    print_copy_paste("Syntax Components");
    fs::copy(filepath_to_copy,filepath_to_paste);


    fs::remove_dir_all(output);
}



pub fn inst(){
    let path                     = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_path: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let root                     = splitted_path[0];


    print_chapter("INSERT NEWS...");
    print_green("current Directory:  ");
    print_red(&path);
    print_red("\r\n");

    let filepath_new = format!("{}Workspaces\\DevCLI\\Parameter\\Basegame_News.txt",root);
    let filepath_old = format!("{}Workspaces\\PatnicRoom\\tools\\RuntimeConfigs\\Text-inserts\\Basegame_News.txt",root);
    fs::copy(filepath_new, filepath_old);



    print_chapter("insert Changelog...");
    print_green("\r\ncurrent Directory:  ");
    print_red(&path);
    print_red("\r\n");

    let filepath_new = format!("{}Workspaces\\DevCLI\\Parameter\\Basegame_Changelog.txt",root);
    let filepath_old = format!("{}Workspaces\\PatnicRoom\\tools\\RuntimeConfigs\\Text-inserts\\Basegame_Changelog.txt",root);
    fs::copy(filepath_new, filepath_old);

}




fn print_copy_paste(current_dir:&str){
    let cached_string = format!("PatnicRoom\\tools\\Statistics\\output\\Atlas_{}.md\r\n",current_dir);
    print_green("\r\ncopy: ");
    print_red(&cached_string);

    let caqched_string = format!("docs\\docs\\Atlas\\Atlas_{}.md\r\n",current_dir);
    print_green("to:   ");
    print_red(&caqched_string);

    print_red("\r\n")
}

fn print_chapter(chapter_name:&str){
    let middle_name = format!("   {}      \r\n",chapter_name);

    print_green("\r\n\r\n\r\n");
    print_green(" =============================    \r\n");
    print_green(       &middle_name                );
    print_green(" =============================    \r\n");
    print_red("\r\n\r\n\r\n");
}


fn get_all_atlas_names()->Vec<&'static str>{
    let mut atlas_to_sync = Vec::new();
    atlas_to_sync.push("Race");
    atlas_to_sync.push("Role");
    atlas_to_sync.push("Specialty");
    atlas_to_sync.push("Static");
    atlas_to_sync.push("Tile");
    atlas_to_sync.push("Components");
    atlas_to_sync.push("Kitparts");
    atlas_to_sync.push("Enum");
    atlas_to_sync.push("Tilesets");
    return atlas_to_sync;
}






pub fn chek(){
    let path                     = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_path: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();

    let root                     = splitted_path[0];

    let desktop_filepath         = "C:\\Users\\Daniel\\Desktop\\PatnicRoom Master Directory";
    let push_gdb_                = "C:\\Users\\Daniel\\Desktop\\PatnicRoom Master Directory\\to push\\GameData";

    
    
    print_chapter("COLLECT GAMEDATA");
    gamedata(desktop_filepath,root);
    
    print_chapter("COLLECT DIOJSONES");
    diojsones(desktop_filepath,root);
    
    print_chapter("COLLECT PATNICROOM");
    patnicroom(desktop_filepath,root);
    

    let push_dio = format!("{}\\to push\\DioJSONes",desktop_filepath);
    let push_pat = format!("{}\\to push\\PatnicRoom",desktop_filepath);
    fs::remove_dir_all(push_gdb_);


    print_chapter("SET RIGHT BOOT-PARAMETER");
    let gameinit_file = format!("{}\\tools\\gameinit.txt",push_pat);
    fs::remove_file(gameinit_file);
    let gameinit_file = format!("{}\\tools\\gameinit.txt",push_pat);
    fs::write(gameinit_file, "bootMenue");


    print_chapter("START UNIT-TEST");
    print_red("WIP");


    print_chapter("PASSWORDS IN GAME");
    print_red("WIP");


    print_chapter("GODOT EXPORTING");
    print_red("WIP");


    print_chapter("READY TO PUSH");
}

fn gamedata(desktop_filepath:&str,root:&str){
    let push_gdb        = format!("{}\\to push",desktop_filepath);
    let push_gdb_       = format!("{}\\to push\\GameData",desktop_filepath);
    let push_gdb_per    = format!("{}\\Personal",push_gdb_);
    let push_gdb_com    = format!("{}\\Community",push_gdb_);

    let local_gdb_per   = format!("{}Workspaces\\GameData\\Personal",root);
    let local_gdb_com   = format!("{}Workspaces\\GameData\\Community",root);
    let local_gdb_stab  = format!("{}Workspaces\\GameData\\Stable",root);


    print_green("checks for redundant content...\r\n");
    let paths = fs::read_dir(local_gdb_per).unwrap();
    for path in paths {
        let to_string = format!("there are still personal files in Gamedata: \r\n{}\r\nthose will be ignored\r\n\r\n", path.unwrap().path().display());
        print_red(&to_string);}
    let paths = fs::read_dir(local_gdb_com).unwrap();
    for path in paths {
        let to_string = format!("there are still personal files in Gamedata: \r\n{}\r\nthose will be ignored\r\n\r\n", path.unwrap().path().display());
        print_red(&to_string);} 
    print_green("finished!\r\n\r\n");


    fs::create_dir(&push_gdb_);
    universal_check(&push_gdb_, &local_gdb_stab);
    print_green("creates Personal...\r\nfinished!\r\n\r\ncreates Community...\r\nfinished!\r\n");
    fs::create_dir(&push_gdb_per);
    fs::create_dir(&push_gdb_com);
}


fn diojsones(desktop_filepath:&str,root:&str) {
    let local_dio      = format!("{}Workspaces\\DioJSONes\\",root);  
    let local_dio_per  = format!("{}\\Personal",local_dio);
    let local_dio_com  = format!("{}\\Community",local_dio);

    let push_dio       = format!("{}\\to push",desktop_filepath);
    let push_gdb       = format!("{}\\to push\\GameData",desktop_filepath);   


    universal_check(&push_dio, &local_dio);
    print_green("resetting local personal...\r\nfinished!\r\n\r\nresetting local Community...\r\nfinished!\r\n\r\n");
    reset_dir(&local_dio_com, "");
    reset_dir(&local_dio_per, "");
    print_red("please check config/syntaxIndex.json maunually!\r\nplease check config/syntaxAtlas.json maunually!\r\n\r\n");

    print_green("creates DioJSONes GameData...\r\n");
    let push_dio_gdb = format!("{}\\DioJSONes",push_dio);
    copy_items(&push_gdb,&push_dio_gdb);
    print_green("finished!\r\n\r\n");
}


fn patnicroom(desktop_filepath:&str,root:&str){
    let push_pat        = format!("{}\\to push",desktop_filepath);
    let push_gdb        = format!("{}\\to push\\GameData",desktop_filepath);
    

    let local_pat       = format!("{}Workspaces\\PatnicRoom",root);

    universal_check(&push_pat, &local_pat);
    
    print_green("creates PatnicRoom GameData...\r\n");
    let push_pat_gdb    = format!("{}\\PatnicRoom",push_pat);
    copy_items(&push_gdb,&push_pat_gdb);
    print_green("finished!\r\n");
}








fn universal_check(push_workspace:&str,local_workspace:&str){
    print_green("resetting push...\r\n");
    print_green("finished!\r\n\r\n");

    print_green("creates push...\r\n");
    copy_items(&local_workspace,&push_workspace);
    print_green("finished!\r\n\r\n");
}

fn reset_dir(root:&str,dir_path:&str){
   // print_red(root);
   // print_red(dir_path);

    fs::remove_dir_all( format!("{}{}",root,dir_path) );
    fs::create_dir( format!("{}{}",root,dir_path) );
}


fn copy_items(path_to_copy:&str,path_to_paste:&str){
   // print_red(path_to_copy);
   // print_red(path_to_paste);

    let mut options = fs_extra::dir::CopyOptions::new();
    options.overwrite=true;
    
    let mut to_copy = Vec::new();
    to_copy.push(path_to_copy);

    fs_extra::copy_items(&to_copy, path_to_paste, &options).expect("file not found");
}
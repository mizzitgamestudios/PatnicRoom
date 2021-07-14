use std::io;
use crossterm::style::*;
use std::{assert, env, format, fs, print, str};
use std::process::Command;
use crossterm::*;
use std::io::{stdout, Write};


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
pub fn maintain_window_format()-> Result<()>{execute!(stdout(), SetForegroundColor(Color::Green), SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),)?;Ok(())}


pub fn set_up(){
    let mut backup = [  "dipa" , "DioJSONes -> P@tnicroom",
                        "diga" , "DioJSONes -> GameData",
                        "mdws" , "Docs      -> Webside",
                        "sygd" , "Basegame  -> Webside, GameData, P@tnicroom"];

    print_red("---- SYNCHRONICATION MENUE ----\n\r\n\r");
    print_entry(&backup[0], &backup[1]);
    print_entry(&backup[2], &backup[3]);
    print_entry(&backup[4], &backup[5]);


    
    print!("\n\r\n\r\n\r\n");
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
    maintain_window_format();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}
    print_red("\r\n\r\n");
    match input.as_str() {
        "esc"  => print!(""),
        "mdws" => mdws(),
        "diga" => diga(),
        "dipa" => dipa(),
        _      => print!("still WIP"),
    }
    maintain_window_format();
}







pub fn mdws(){
    print_chapter("EXPORT MARKDOWN TO WEBSIDE...");
    print_current_dir();

    
    let path                        = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_root: Vec<&str>    = path.split("\\Workspaces\\DevCLI\\Cargo").collect();

    let root                        = splitted_root[0];
    let docs                        = format!("{}\\docs",root);

    
    env::set_current_dir(&docs).is_ok();
    print_current_dir();


    Command::new("mkdocs").arg("build").status().expect("process failed to execute");
    

    let mut filepaths_to_backup = Vec::new();
    let mut options=fs_extra::dir::CopyOptions::new();
    options.overwrite=true;


    filepaths_to_backup.push(format!("{}\\site", docs));
    let mut filepath_to_paste = format!("{}\\Workspaces\\Webside\\mkDocs",root);

    fs_extra::copy_items(&filepaths_to_backup,filepath_to_paste,&options);
    fs::remove_dir_all(format!("{}\\site", docs));
}



pub fn sygd(){
    diga();
    dipa();
    mdws();
}


fn print_chapter(chapter_name:&str){
    let middle_name = format!("   {}      \r\n",chapter_name);

    print_green("\r\n\r\n\r\n");
    print_green(" =====================================    \r\n");
    print_green(       &middle_name                );
    print_green(" =====================================    \r\n");
    print_red("\r\n\r\n\r\n");
}

fn print_current_dir(){
    print_green("\r\ncurrent Directory:  ");
    print_red(&env::current_dir().unwrap().to_str().unwrap().to_string());
    print_red("\r\n\r\n");
    maintain_window_format();
}



pub fn diga(){
    let path                        = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_root: Vec<&str>    = path.split("\\Workspaces\\DevCLI\\Cargo").collect();
    print_chapter("TRANSFER DIOJSONES TO GAMEDATA...");
    
    let root                        = splitted_root[0];

    let mut diojsones_source        = Vec::new();
    let diojsones_generated         = format!("{}\\Workspaces\\DioJSONes\\Personal",root);
    diojsones_source.push(diojsones_generated);
    
    
    let gamedata_destination        = format!("{}\\Workspaces\\GameData",root);


    let diojsones_generated         = format!("{}\\Workspaces\\DioJSONes\\Personal",root);
    print_copy_paste(&diojsones_generated, &gamedata_destination);

    let mut options=fs_extra::dir::CopyOptions::new();
    options.overwrite=true;

    fs_extra::copy_items(&diojsones_source,gamedata_destination,&options);

}

pub fn dipa(){
    print_chapter("TRANSFER DIOJSONES TO P@TNICROOM...");
    let path                        = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_root: Vec<&str>    = path.split("\\Workspaces\\DevCLI\\Cargo").collect();
    
    let root                        = splitted_root[0];

    let mut diojsones_source        = Vec::new();
    let diojsones_generated         = format!("{}\\Workspaces\\DioJSONes\\Personal",root);
    diojsones_source.push(diojsones_generated);
    
    
    let gamedata_destination        = format!("{}\\Workspaces\\PatnicRoom\\GameData",root);
    print!("{}",gamedata_destination);
    
    let mut options=fs_extra::dir::CopyOptions::new();
    options.overwrite=true;

    let diojsones_generated         = format!("{}\\Workspaces\\DioJSONes\\Personal",root);
    print_copy_paste(&diojsones_generated, &gamedata_destination);

    fs_extra::copy_items(&diojsones_source,gamedata_destination,&options);
    fs::create_dir(format!("{}\\Workspaces\\PatnicRoom\\GameData\\Stable",root));
    fs::create_dir(format!("{}\\Workspaces\\PatnicRoom\\GameData\\Community",root));
}



fn print_copy_paste(copy_path:&str,paste_path:&str){
    print_green("\r\ncopy: ");
    print_red(&copy_path);

    print_green("\r\nto:   ");
    print_red(&paste_path);

    print_red("\r\n")
}
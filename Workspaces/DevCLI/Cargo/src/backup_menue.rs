use crossterm::style::*;

use std::io;
use std::fs;
use std::env;
use fs_extra::dir::copy;


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }

pub fn set_up(){
    let mut backup = ["crte","creating a new backup-state(overwrites previous Backups!)","load","loading an old backup-state","rset","reseting Backups to empty folders"];
    
    print_entry(&backup[0], &backup[1]);
    print_entry(&backup[2], &backup[3]);
    print_entry(&backup[4], &backup[5]);

    
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
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}

    match input.as_str() {
        "crte" => get_back_up(),
        "load" => load_back_up(),
        "rset" => reset_back_up(),
        "esc"  => print!(""),
        _      => print!(""),
    }
}






pub fn get_back_up(){
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();

    let splitted_root: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let mut root = splitted_root[0];

    
    
    let mut filepaths_to_backup = Vec::new();
    
    let mut workspaces_to_backup = Vec::new();
    workspaces_to_backup.push("GameData");
    workspaces_to_backup.push("PatnicRoom");
    workspaces_to_backup.push("Webside");
    workspaces_to_backup.push("DioJSONes");
    
    for current_dir in workspaces_to_backup.iter(){
        let mut filepath_to_copy = format!("{}{}\\{}", root, "Workspaces",current_dir);
        
        print!("copy    {}\r\n", filepath_to_copy);
        print!("insert  {}\r\n", format!("{}{}\\{}", root, "Backups",current_dir));
        
        filepaths_to_backup.push(filepath_to_copy); 
    }
    

    let mut options=fs_extra::dir::CopyOptions::new();
    options.overwrite=true;
    
    fs_extra::copy_items(&filepaths_to_backup,format!("{}{}", root, "Backups"),&options);
}




pub fn load_back_up(){
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();

    let splitted_root: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let mut root = splitted_root[0];



    let mut filepaths_to_backup = Vec::new();
    
    let mut workspaces_to_backup = Vec::new();
    workspaces_to_backup.push("GameData");
    workspaces_to_backup.push("PatnicRoom");
    workspaces_to_backup.push("Webside");
    workspaces_to_backup.push("DioJSONes");
    
    for current_dir in workspaces_to_backup.iter(){
        let mut filepath_to_copy  = format!("{}{}\\{}", root, "Backups",current_dir);
        let mut filepath_to_delete = format!("{}{}\\{}", root, "Workspaces",current_dir);

        print!("copy    {}\r\n", filepath_to_copy);
        print!("remove  {}\r\n", filepath_to_delete);
        
        filepaths_to_backup.push(filepath_to_copy); 
        fs::remove_dir_all(filepath_to_delete);
    }


    let mut options=fs_extra::dir::CopyOptions::new();
    options.overwrite=true;
    
    fs_extra::copy_items(&filepaths_to_backup,format!("{}{}", root, "Workspaces"),&options);
}




fn reset_back_up(){
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();

    let splitted_root: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let mut root = splitted_root[0];


    
    let mut workspaces_to_delete = Vec::new();
    workspaces_to_delete.push("GameData");
    workspaces_to_delete.push("PatnicRoom");
    workspaces_to_delete.push("Webside");
    workspaces_to_delete.push("DioJSONes");
    
    for current_dir in workspaces_to_delete.iter(){
        let mut filepath_to_delete = format!("{}{}\\{}", root, "Backups",current_dir);

        print!("remove  {}\r\n", filepath_to_delete);
        
        fs::remove_dir_all(filepath_to_delete);
    }
}
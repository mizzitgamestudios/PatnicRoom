use crossterm::style::*;

use std::io;
use std::fs;
use std::env;
use std::io::{stdout, Write};

use crossterm::*;


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
pub fn maintain_window_format()-> Result<()>{execute!(stdout(), SetForegroundColor(Color::Green), SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),)?;Ok(())}


pub fn set_up(){
    let mut backup = [  "set" , "creating a new backup-state(overwrites previous Backups!)",
                        "get" , "loading an old backup-state",
                        "rset" , "reseting Backups to empty folders"];
    
    print_red("---- BACK UP MENUE ----\n\r\n\r");
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
    maintain_window_format();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}
    
    
    
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();
    let splitted_root: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let mut root = splitted_root[0];

    
    print_red("\r\n\r\n");
    print_green("current Directory:  ");
    print_red(&path);
    print_red("\r\n\r\n");


    match input.as_str() {
        "set" => get_back_up(&root),
        "get" => load_back_up(&root),
        "rset" => reset_back_up(&root),
        "esc"  => print!(""),
        _      => print!("still WIP"),
    }
    maintain_window_format();
}






pub fn get_back_up(root:&str){
    print_chapter("Set Back-up");
    print_folder_exchange("insert", root);
    

    let filepaths_work       = get_workspaces_filepaths(root, "Workspaces");
    let filepath_backup      = format!("{}{}", root, "Backups");

    let mut options          = fs_extra::dir::CopyOptions::new();
    options.overwrite=true;
    
    fs_extra::copy_items(&filepaths_work,filepath_backup,&options);
}


pub fn load_back_up(root:&str){
    print_chapter("Get Back-up");
    print_folder_exchange("remove", root);


    let filepaths_backups      = get_workspaces_filepaths(root, "Workspaces");    
    print!("{}", root);
    for current_dir in filepaths_backups.iter(){ fs::remove_dir_all(current_dir); }


    let filepaths_backups      = get_workspaces_filepaths(root, "Backups");
    let filepaths_work         = format!("{}{}", root, "Backups");
    
    let mut options            = fs_extra::dir::CopyOptions::new();
    options.overwrite=true;
    
    fs_extra::copy_items(&filepaths_backups,filepaths_work,&options);
}


pub fn reset_back_up(root:&str){
    print_chapter("Reset Back-up");

    let filepaths_backup = get_workspaces_filepaths(root, "Backups");
    
    for current_dir in filepaths_backup.iter(){
        print_red("remove");
        let output = format!("  {}\r\n", current_dir);
        print_green(&output);
        print_red("--------");
        print_green("\r\n");
        
        fs::remove_dir_all(current_dir);
    }
}






fn get_workspaces_filepaths(root:&str, backup_or_workspace:&str) -> Vec <String>{
    let mut workspace_names = Vec::new();
    workspace_names.push("GameData");
    workspace_names.push("PatnicRoom");
    workspace_names.push("Webside");
    workspace_names.push("DioJSONes");


    let mut workspace_filepaths = Vec::new();
    for current_dir in workspace_names.iter(){
        let filepath = format!("{}{}\\{}", root, backup_or_workspace,current_dir);
        workspace_filepaths.push(filepath);
    }

    return workspace_filepaths;
}


fn print_folder_exchange(second_description:&str, root:&str){
    let filepaths_work   = get_workspaces_filepaths(root, "Workspaces");
    let filepaths_backup = get_workspaces_filepaths(root, "Backups");
    
    for current_filepath_nr in 0..filepaths_work.len(){
        let current_work = &filepaths_work[current_filepath_nr];
        let current_back = &filepaths_backup[current_filepath_nr];

        let output = format!("copy    {}\r\n",current_work);
        print_green(&output);

        let output = format!("{}  {}\r\n",second_description,current_back);
        print_red(&output);

        print_red("--------");
        print_green("\r\n");
    }
}



fn print_chapter(chapter_name:&str){
    let middle_name = format!("   {}      \r\n",chapter_name);

    print_green("\r\n\r\n\r\n");
    print_green(" =============================    \r\n");
    print_green(       &middle_name                );
    print_green(" =============================    \r\n");
    print_red("\r\n\r\n\r\n");
}
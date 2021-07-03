use std::io;
use std::env;
use std::process::Command;
use std::fs;

use crossterm::style::*;

use crossterm::*;
use std::io::{stdout, Write};
fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
fn execute_cmd(cmd_para:&str, arg_para:&str){  Command::new(cmd_para).arg(arg_para).status();  }
pub fn maintain_window_format()-> Result<()>{execute!(stdout(), SetForegroundColor(Color::Green), SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),)?;Ok(())}

pub fn set_up(){
    let mut backup = [  "set" , "inserting new elemnts from custome GameData of base edition",
                        "get" , "resetting the GameData workspace to offical stable version",
                        "srst" , "resets the stable Gamedata to the current version (connection to web neccessary)"];

    print_red("---- MONGO DATABASE MENUE ----\n\r\n\r");
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
    print_red("\r\n\r\n");
    match input.as_str() {
        "esc"  => print!(""),
        "srst" => srst(),
        _      => print!("still WIP"),
    }
    maintain_window_format();
}

fn srst(){
    let path                     = env::current_exe().unwrap().to_str().unwrap().to_string();
    let splitted_path: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let root                     = splitted_path[0];

    print_chapter("RESET STABLE GAMEDATA");


    let mut current_dir = format!("{}Workspaces\\GameData\\Stable\\Actor_Attributes",root);
    fs::create_dir(format!("{}",current_dir));
    let mut subdir = Vec::new();
    subdir.push("Factions");
    subdir.push("Races");
    subdir.push("Roles");
    subdir.push("Specialties");
    for i in subdir.iter(){fs::create_dir(format!("{}\\{}",current_dir,i));}


    let mut current_dir = format!("{}Workspaces\\GameData\\Stable\\Gear",root);
    fs::create_dir(format!("{}",current_dir));
    let mut subdir = Vec::new();
    subdir.push("Loot_Tables");
    subdir.push("Consumables");
    for i in subdir.iter(){fs::create_dir(format!("{}\\{}",current_dir,i));}


    let mut current_dir = format!("{}Workspaces\\GameData\\Stable\\Kits",root);
    fs::create_dir(format!("{}",current_dir));
    let mut subdir = Vec::new();
    subdir.push("Cyberware");
    subdir.push("Hack");
    subdir.push("Drone");
    create_kit_sub_dir("Matrix", subdir, &current_dir);

    let mut current_dir = format!("{}Workspaces\\GameData\\Stable\\Kits",root);
    let mut subdir = Vec::new();
    subdir.push("Rite");
    subdir.push("Infusion");
    subdir.push("Spell");
    create_kit_sub_dir("Magic", subdir, &current_dir);

    let mut current_dir = format!("{}Workspaces\\GameData\\Stable\\Kits",root);
    let mut subdir = Vec::new();
    subdir.push("Gun");
    subdir.push("Armor");
    subdir.push("Meele");
    create_kit_sub_dir("Meat", subdir, &current_dir);

}



fn create_kit_sub_dir(mType:&str,kits:Vec<&str>,current_dir:&str){
    let sub_dir = format!("{}\\{}",current_dir,mType);
    fs::create_dir(sub_dir);
    let sub_dir = format!("{}\\{}",current_dir,mType);

    for i in kits.iter(){
        fs::create_dir(format!("{}\\{}",sub_dir,i));

        fs::create_dir(format!("{}\\{}\\Base",sub_dir,i));
        fs::create_dir(format!("{}\\{}\\Mod",sub_dir,i));
        fs::create_dir(format!("{}\\{}\\Appendix",sub_dir,i));
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



use std::io;
use std::env;
use std::process::Command;
use std::fs;

use crossterm::style::*;


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
fn execute_cmd(cmd_para:&str, arg_para:&str){  Command::new(cmd_para).arg(arg_para).status();  }

pub fn set_up(){
    let mut backup = [
        "syDB" , "synchroning IDE to GameDataq",
        "push" , "pushing all changes",
        "news" , "updating all news parts",
        "stat" , "calculating all stats",
    ];

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
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}

    match input.as_str() {
        "push" => push_state(),
        "esc"  => print!(""),
        _      => print!(""),
    }
}




fn push_state(){
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();

    let splitted_parameter: Vec<&str> = path.split("Cargo").collect();
    let mut parameter_dir = format!("{}{}",splitted_parameter[0],"Parameter");

    
    let filepath = format!("{}\\{}",parameter_dir,"commit_message.txt");
    print!("collecting push-comment from parameters/commit_message.txt:\r\n");

    let commit_message = fs::read_to_string(filepath).expect("Unable to read file");
    let cli_formated_commit = format!("\"{}\"",commit_message);
    print!("{}",commit_message);

    let add = Command::new("git add .").status().expect("failed");

    //Command::new("git commit").args(&["-m",cli_formated_commit.as_str()]).status();
    //Command::new("git push").status();

}
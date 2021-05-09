use std::io;
use crossterm::style::*;

use std::process::Command;

fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
fn execute_cmd(cmd_para:&str, arg_para:&str){  Command::new(cmd_para).arg(arg_para).status();  }

pub fn set_up(){
    let mut backup = ["splt","splitting up into other Workspace configs"];

    print_entry(&backup[0], &backup[1]);
    
    
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
        "crte" => print!(""),
        "load" => print!(""),
        "esc"  => print!(""),
        _      => print!(""),
    }
}







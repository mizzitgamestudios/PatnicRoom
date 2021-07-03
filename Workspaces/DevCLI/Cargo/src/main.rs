extern crate clap;
extern crate structopt;
extern crate cursive;
extern crate crossterm;


use std::process::Command;
use std::io;

use std::io::{stdout, Write};
use crossterm::*;
use crossterm::style::*;
use crossterm::terminal::*;
use std::env;

mod synchronicer_menue;
mod mongoDB_menue;
mod backup_menue;
mod distributer_menue;

mod terminal_formatter;
mod main_menue_printer;

//  execute_cmd("mkdir","3222222222222");
fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }
pub fn maintain_window_format()-> Result<()>{execute!(stdout(), SetForegroundColor(Color::Green), SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),)?;Ok(())}

fn main() {
    startup();
    change_to_submenue();
    
    
    let mut run = false;

    while run{
        startup();
        change_to_submenue();
    }
}
    



fn execute_cmd(cmd_para:&str, arg_para:&str){  Command::new(cmd_para).arg(arg_para).status();  }


fn change_to_submenue(){
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}

    startup();
    print_red("\r\n");
    match input.as_str() {
        "back" => backup_menue::set_up(),
        "dstr" => distributer_menue::set_up(),
        "sync" => synchronicer_menue::set_up(),
        "mndb" => mongoDB_menue::set_up(),
        "coca" => set_up(),
        "esc"  => print!(""),
      _    => print!("still WIP"),
    }

}

pub fn startup(){
    terminal_formatter::initial_window_formatter();
    execute_cmd("clear","-x");

    terminal_formatter::print_very_cool_ascii();
    main_menue_printer::print_main();
}







pub fn set_up(){
    let mut backup = [  "docs" , "updates docs of local webside:               dstr/calc -> sync/digy -> sync/dipa -> sync/mdws",
                        "dstr" , "distributes all possible content:            docs      -> dstr/splt -> dstr/inst",
                        "chek" , "prepares and checks Workspaces for push:     docs      -> dstr      -> dstr/chek"];
    
    print_red("---- CONCATTED FUNCTIONS ----\n\r\n\r");
    print_entry(&backup[0], &backup[1]);
    print_entry(&backup[2], &backup[3]);
    print_entry(&backup[4], &backup[5]);
    

    print!("\r\n\r\n\r\n");
    for i in 0..120{print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:100 }))}
    print!("\r\n");
    exec_process();
}



fn print_entry(input:&str,desc:&str){
    print_red(input);
    for i in 0..5-input.len(){print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:49 }))}
    print_green("> for   ");
    print_red(desc);
    print!("\r\n");
}

fn exec_process(){
    maintain_window_format();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}

    match input.as_str() {
        "docs" => upmd(),
        "esc"  => print!(""),
        "dstr" => dstr(),
        "chek" => chek(),
        _      => print!("still WIP"),
    }
    maintain_window_format();
}


fn chek(){
    dstr();
    distributer_menue::chek();
}



fn dstr(){
    let path = env::current_dir().unwrap().to_str().unwrap().to_string();
    let splitted_root: Vec<&str> = path.split("Workspaces\\DevCLI\\Cargo").collect();
    let root = splitted_root[0];


    backup_menue::get_back_up(root);
    maintain_window_format();
    
    distributer_menue::proxy_split();
    maintain_window_format();

    distributer_menue::inst();
    maintain_window_format();

    distributer_menue::calc();
    maintain_window_format();
    
    synchronicer_menue::sygd();
    maintain_window_format();


    backup_menue::reset_back_up(root);
}



fn upmd(){
    distributer_menue::calc();
    maintain_window_format();
    
    synchronicer_menue::sygd();
    maintain_window_format();

}
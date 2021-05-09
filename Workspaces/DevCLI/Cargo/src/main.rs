extern crate clap;
extern crate structopt;
extern crate cursive;
extern crate crossterm;



use std::process::Command;
use std::io;


mod publisher_menue;
mod config_splitter;
mod backup_menue;
mod manager_menue;

mod terminal_formatter;
mod main_menue_printer;

//  execute_cmd("mkdir","3222222222222");

fn main() {
    let mut run = false;
    
        startup();
        change_to_submenue();
            
        }
    



fn execute_cmd(cmd_para:&str, arg_para:&str){  Command::new(cmd_para).arg(arg_para).status();  }


fn change_to_submenue(){
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");

    if let Some('\n')=input.chars().next_back() {input.pop();}
    if let Some('\r')=input.chars().next_back() {input.pop();}

    startup();
    match input.as_str() {
        "back" => backup_menue::set_up(),
        "pbls" => publisher_menue::set_up(),
        "cfgs" => config_splitter::set_up(),
        "mngr" => manager_menue::set_up(),
        "esc"  => execute_cmd("mkdir", "fbfbfb"),
      _    => print!(""),
    }

}


pub fn startup(){
    let mut all_menues = main_menue_printer::initialice_menues();

    terminal_formatter::initial_window_formatter();
    execute_cmd("clear","-x");

    terminal_formatter::print_very_cool_ascii();
    main_menue_printer::print_main(all_menues);
}
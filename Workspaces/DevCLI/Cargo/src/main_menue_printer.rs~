extern crate crossterm;


extern crate clap;
extern crate structopt;
extern crate cursive;

use std::io;
use crossterm::style::*;




pub fn print_main(){
    let mut backup = [  "back" , "Back-up System",
                        "dstr" , "Distribution System",
                        "mndb" , "MongoDB System",
                        "sync" , "Synchronice System",
                        "coca" , "concatted functions"];

    print_red("---- MAIN MENUE ----\n\r\n\r");
    print_entry(&backup[0], &backup[1]);
    print_entry(&backup[2], &backup[3]);
    print_entry(&backup[4], &backup[5]);
    print_entry(&backup[6], &backup[7]);
    print_important(&backup[8], &backup[9]);
    

    print!("\r\n\r\n\r\n");
    for i in 0..120{print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:100 }))}
    print!("\r\n");
}


fn print_entry(input:&str,desc:&str){
    print_red(input);
    for i in 0..5-input.len(){print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:49 }))}
    print_green("> for   ");
    print_red(desc);
    print!("\r\n");
}

fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }


fn print_important(input:&str,desc:&str){
    print!("\n\r\n\r");
    print!("{}",input.bold().italic().on(Color::Rgb { r:21,g:27,b:49 }).red());
    print_green(" > for   ");
    print!("{}",desc.bold().italic().on(Color::Rgb { r:21,g:27,b:49 }).red());

}






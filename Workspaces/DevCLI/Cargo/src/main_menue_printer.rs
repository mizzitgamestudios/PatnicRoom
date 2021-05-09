extern crate crossterm;


extern crate clap;
extern crate structopt;
extern crate cursive;

use std::io;
use crossterm::style::*;



pub struct Menue{
    state_code        :     String,
    main_menue_input  :     String,
    valid_inputs      : Vec<String>,
    input_description : Vec<String>
}

pub fn initialice_menues()-> [Menue;4]{
    let backup          = initialice_struct("backup","back",
                                            vec![ "crte"                        , "load"                     ],
                                            vec![ "creating a new backup-state" , "load an old backup-state" ]);


    let config_splitter = initialice_struct("Config-splitter","cfgs",
                                            vec![ "splt"                                      ],
                                            vec![ "split the current content across Workspace" ]);


    let manager         = initialice_struct("manager","mngr",
                                            vec![ "syDB"                             , "push"                        , "news"          , "stat"                    ],
                                            vec![ "Syncing all folders with MongoDB" , "commit and Push your change" , "updating News" , "calculate current stats" ]);


    let publisher       = initialice_struct("publisher","pbls",
                                            vec![ "crte"                        , "load"                     ],
                                            vec![ "creating a new backup-state" , "load an old backup-state" ]);

    
    return [backup,config_splitter,manager,publisher];
}




fn initialice_struct(current_name:&str, main_input:&str, current_inputs:Vec<&str>, current_descriptions:Vec<&str>)-> Menue{
    let mut struct_inputs = Vec::new();
    for current_input in current_inputs.iter(){  struct_inputs.push(current_input.to_string())  }
    
    let mut struct_desc = Vec::new();
    for current_desc in current_descriptions.iter(){  struct_desc.push(current_desc.to_string())  }
    
    let current_menue = Menue{
        main_menue_input  : main_input.to_string(),
        state_code        : current_name.to_string(),
        valid_inputs      : struct_inputs,
        input_description : struct_desc,
    };

    return current_menue;
}





pub fn print_main(allMenues:[Menue;4])-> [Menue;4]{
    let separator:&str  = "> for   ";

    for i in 0..allMenues.len(){
        let mut current_menue = &allMenues[i];
        let name              = current_menue.state_code.as_str();
        let input             = current_menue.main_menue_input.as_str();

        print_red(input);
        for i in 0..5-input.len(){print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:49 }))}

        print_green(separator);
        print_red(name);

        println!();
    }
    
    print!("\r\n\r\n\r\n");
    for i in 0..120{print!("{}"," ".green().on(Color::Rgb { r:21,g:27,b:100 }))}
    println!();

    return allMenues;//[allMenues[0],allMenues[1],allMenues[2],allMenues[3]];
}


fn print_red(text:&str){    print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).red());    }
fn print_green(text:&str){  print!("{}",text.bold().on(Color::Rgb { r:21,g:27,b:49 }).green());  }







pub fn validateMainMenueInput(allMenues:[Menue;4])-> String{
    let mut console_input = String::new();
    io::stdin().read_line(&mut console_input).expect("Failed to read line");

    let one   = &allMenues[0].main_menue_input;
    let two   = &allMenues[1].main_menue_input;
    let three = &allMenues[2].main_menue_input;
    let four  = &allMenues[3].main_menue_input;
    let esc   = "esc";
    let not_valid = "NOT_VALID";


    match io::stdin().read_line(&mut console_input){

        Ok(one)   =>{ println!("{}", console_input); return "back".to_string();        },
        Ok(two)   =>{ println!("{}", console_input); return "cfgs".to_string();        },
        Ok(three) =>{ println!("{}", console_input); return "mngr".to_string();        },
        Ok(four)  =>{ println!("{}", console_input); return "pbls".to_string();        },
        Ok(_)     =>{                                return "NOT_VALID".to_string();   },
        Err(e)    =>{                                return "NOT_VALID".to_string();   },
        Ok(esc) =>{                                  return "esc".to_string();         }
    }
}


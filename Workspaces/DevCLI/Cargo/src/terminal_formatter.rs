extern crate crossterm;

use std::io::{stdout, Write};
use crossterm::*;
use crossterm::style::*;
use crossterm::terminal::*;





pub fn initial_window_formatter()-> Result<()>{
    for i in 0..50 {println!("")}  // to hide the default teminal formatting of before 

    execute!(
        stdout(),
        
        SetForegroundColor(Color::Green),
        SetBackgroundColor(Color::Rgb { r:21,g:27,b:49 }),

        SetSize(120, 50),
        ScrollUp(50)
    )?;
    Ok(())
}


pub fn print_very_cool_ascii(){
    // look away here is nothing to see !!!
    let mut firstRow     = "                ____ ";        
    let mut secondRow    = "               / __ \\";     
    let mut thirdRow     = "/ /_/ /";       
    let mut fourthRow    = "/ ____/";       
    let mut fithRow      = "/ /    ";     
    let mut sixthRow     = "/_/      ";  



    let mut firstRowTwo  ="   ______";
    let mut secondRowTwo =" / ____ \\ ";
    let mut thirdRowTwo  ="/ / __ `/";
    let mut forthRowTwo  ="/ / /_/ /";
    let mut fithRowTwo   =" \\ \\__,_/_";
    let mut sixthRowTwo  =" ";

    let mut firstRowThree     = "    __           __                                               \r\n";        
    let mut secondRowThree    = "__/ /_______   (_)._____ _____ ____   ____  _____ ___       \r\n              ";
    let mut thirdRowThree     = "/_  ____/ __ \\ / // ____// ___// __ \\ / __ \\ / __ `__ \\     \r\n             ";
    let mut fourthRowThree    = " /  /_  / / / // // |___ / /   / /_/ // /_/ // / / / / /        \r\n            ";
    let mut fithRowThree      = "|_____|/_/";
    let mut runr="_";
    let mut laaaast="/_//_/";
    let mut judbef="_";
    let pleaselast="\\____//_/";
    let mut postpre= "____";
    let mut postpost = "\\____/";
    let mut twi = "_";
    let mut tes="\\____//_/";
    let mut dwa="/_/";
    let mut test="_";
    let mut testete="/_/";
    let mut sixthRowThree     = "      \\_____________________________________________________________________________\\           \r\n          ";
    let mut postfithRowThree = "______________\r\n              ";

    print!("\r\n");
    print!("{}",firstRow.green());
    print!("{}",firstRowTwo.red()); //@
    print!("{}{}",firstRowThree.green(),secondRow.green());
    print!("{}",secondRowTwo.red());//@
    print!("{}",secondRowThree.green());
    print!("{}",thirdRow.green());
    print!("{}",thirdRowTwo.red());//@
    print!("{}{}",thirdRowThree.green(),fourthRow.green());
    print!("{}",forthRowTwo.red());
    print!("{}",fourthRowThree.green());

    print!("{}",fithRow.green());
    print!("{}",fithRowTwo.red());//@
    print!("{}",fithRowThree.green(),);
    print!("{}",runr.red());
    print!("{}",laaaast.green());
    
    print!("{}",judbef.red());
    print!("{}",pleaselast.green());  
    print!("{}",postpre.red()); 
    print!("{}",postpost.green(),);
    print!("{}",twi.red(),);
    print!("{}",tes.green(),);
    print!("{}",test.red(),);
    print!("{}",testete.green(),);
    print!("{}",test.red(),);
    print!("{}",dwa.green(),);




    print!("{}",postfithRowThree.red());//@
    print!("{}",sixthRowTwo.red());//@
    print!("{}\r\n\r\n",sixthRowThree.red());
    // yeah i know, it was a sidething through the night :D
}


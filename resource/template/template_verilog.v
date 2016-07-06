//**************************************************************************************************** 
//------------------Copyright © 2016 C-L-G.FPGA1988.Roger Wang. All rights reserved-------------------
//
//                   --              It to be define                --
//                   --                    ...                      --
//                   --                    ...                      --
//                   --                    ...                      --
//**************************************************************************************************** 
//File Information
//**************************************************************************************************** 
//File Name      : verilog_top.v 
//Project Name   : scripts
//Description    : The perl file header comment reference template of the rtl/scripts and so on,the f\
//irst "#" should be replace with the match comment characters when u use other language.
//Github Address : https://github.com/C-L-G/scripts/resource/template/verilog_top.v
//License        : CPL
//**************************************************************************************************** 
//Version Information
//**************************************************************************************************** 
//Create Date    : 05-07-2016 17:00(1th Tue,July,2016)
//First Author   : Roger Wang
//Modify Date    : 05-07-2016 14:20(1th Tue,July,2016)
//Last Author    : Roger Wang
//Version Number : 001   
//Last Commit    : 05-07-2016 14:30(1th Tue,July,2016)
//**************************************************************************************************** 
//Revison History
//**************************************************************************************************** 
//05-07-2016 - Roger Wang - Add the File information and the version info.
//05-07-2016 - Roger Wang - The initial version.
//**************************************************************************************************** 
`timescale 1ns/10ps
module verilog_top(
    clk     ,//I    01
    rst_n   ,//I    01
    write   ,//I    01
    din     ,//I    16
    addr    ,//I    08
    dout     //O    32

);

    //**************************************************************************************************** 
    //1.The Input and Output Declaration
    //**************************************************************************************************** 
    
    
    //---------------------------------------------------------------------------------------------------- 
    //1.1 The Input pins
    //---------------------------------------------------------------------------------------------------- 


    input   wire            clk   ;
    input   wire            rst_n ;
    input   wire            write ;
    input   wire  [15:0]    din   ;
    input   wire  [07:0]    addr  ;
    output  wire  [31:0]    dout  ;


    //**************************************************************************************************** 
    //2.The Global and Local Parameter Declaration
    //**************************************************************************************************** 

    //---------------------------------------------------------------------------------------------------- 
    //2.1 The Input pins
    //---------------------------------------------------------------------------------------------------- 


    //**************************************************************************************************** 
    //3.The Wire and Reg Declaration
    //**************************************************************************************************** 


    //---------------------------------------------------------------------------------------------------- 
    //3.1 The Input pins
    //---------------------------------------------------------------------------------------------------- 


    //**************************************************************************************************** 
    //4.The Main Logic
    //**************************************************************************************************** 



    //---------------------------------------------------------------------------------------------------- 
    //4.1 The Input pins
    //---------------------------------------------------------------------------------------------------- 



    //**************************************************************************************************** 
    //5.The submodule instance
    //**************************************************************************************************** 


    //---------------------------------------------------------------------------------------------------- 
    //5.1 the clock and reset generate module
    //---------------------------------------------------------------------------------------------------- 

//**************************************************************************************************** 
//The End of Module
//**************************************************************************************************** 
endmodule
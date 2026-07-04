`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 16:54:30
// Design Name: 
// Module Name: GCD_datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GCD_datapath(gt,lt,eq,LdA,LdB,clk,sel1,sel2,sel_in,data_in);
input clk,sel1,sel2,sel_in,LdA,LdB;
input [15:0] data_in;
output gt,lt,eq;
//wire declarations of internal signals

wire [15:0] X,Y,Aout,Bout,Subout,Bus;
// assign Bus=sel_in?data_in:Subout;


//instantiating the modules with input,output and control signals


//declaraing two pipo registers for A and B
PIPO A(Aout,Bus,LdA,clk);
PIPO B(Bout,Bus,LdB,clk);

//declaring the mux modules for A and B
MUX Mux_in1(X,Aout,Bout,sel1);
MUX Mux_in2(Y,Aout,Bout,sel2);

//declaing the mux for the data input
MUX Mux_load(Bus,Subout,data_in,sel_in);

//declaring the subtractor module
SUB SB(Subout,X,Y);

//declaring the comparator module
COMP CMP(gt,lt,eq,Aout,Bout);

endmodule

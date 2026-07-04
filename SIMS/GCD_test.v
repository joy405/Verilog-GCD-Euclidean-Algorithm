`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 16:55:15
// Design Name: 
// Module Name: GCD_test
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


module GCD_test;
reg [15:0] data_in;
reg clk,start;
wire done;
reg [15:0] A,B;
GCD_datapath DP(gt,lt,eq,LdA,LdB,clk,sel1,sel2,sel_in,data_in);

controller  CON(LdA,LdB,sel1,sel2,sel_in,clk,start,done,lt,gt,eq);

initial 
begin
 clk=1'b0;


  
#3 start=1'b1;
  
#10000 $finish;
end

always #5 clk=~clk;

initial 
begin
  #12 data_in=16'd143;
  #10 data_in=16'd65;
end
initial 
begin
  $monitor ($time,"%d %d %b",DP.Aout,DP.Bout,done);
  $dumpfile("GCD.vcd");
  $dumpvars(0,GCD_test);
end

endmodule

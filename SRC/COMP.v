`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 16:52:30
// Design Name: 
// Module Name: COMP
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


module COMP(gt,lt,eq,in0,in1);
input [15:0] in0,in1;
output gt,lt,eq;

assign lt=(in0<in1);
assign gt=(in0>in1);
assign eq=(in0==in1);

endmodule

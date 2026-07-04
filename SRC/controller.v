`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 16:53:39
// Design Name: 
// Module Name: controller
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


module controller(LdA,LdB,sel1,sel2,sel_in,clk,start,done,lt,gt,eq);
input clk,start,lt,gt,eq;
output reg LdA,LdB,sel1,sel2,sel_in,done;
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;

always @(posedge clk)
begin
  case(state)
  s0:if(start) state<=s1;
  s1:state<=s2;
  s2:begin
   #2 if(eq) state<=s5;
   else if(lt) state<=s3;
   else if(gt) state<=s4;
  end
  s3:begin
   #2 if(eq) state<=s5;
    else if(gt) state<=s4;
     else if(lt) state<=s3;
  end
  s4:begin
    #2 if(eq) state<=s5;
     else if(lt) state<=s3;
    else if(gt) state<=s4;
  end
  s5:state<=s5;
  default: state<=s0;
  endcase
end

always @(state)
begin
  case(state)
  s0:begin sel_in=1;done=0;LdA=1;LdB=0; end
  s1:begin sel_in=1;done=0;LdA=0;LdB=1; end
  s2:begin 
    if(eq) begin done=1; end
    else if(lt) begin sel1=1;sel2=0;sel_in=0;LdA=0;LdB=1; end
    else if(gt) begin sel1=0;sel2=1;sel_in=0;LdA=1;LdB=0; end
  end
  s3:begin
    if(eq) begin done=1; end
    else if(lt) begin sel1=1;sel2=0;sel_in=0;LdA=0;LdB=1;end
    else if(gt) begin sel1=0;sel2=1;sel_in=0;LdA=1;LdB=0; end
  end
  s4:begin
    if(eq) begin done=1; end
    else if(lt) begin sel1=1;sel2=0;sel_in=0;LdA=0;LdB=1; end
    else if(gt) begin sel1=0;sel2=1;sel_in=0;LdA=1;LdB=0; end
  end
  s5:begin
    done=1;LdA=0;LdB=0;sel1=0;sel2=0;
  end
  default:begin LdA=0;LdB=0;end
  endcase
end

endmodule

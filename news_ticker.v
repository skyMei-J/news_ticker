
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/26 23:55:02
// Design Name: 
// Module Name: lab7_exp2
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
module lab7_exp2(
  input clk,
  input  up,
	output  reg[7:0]enable=8'b11111110,//enable
  output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output dp
    );     
	reg [14:0]move=0;
  wire my_clk;
  reg [3:0]in;
	reg [2:0]count=3'b000;
    my_clk(clk,my_clk);//frequency eliminator
    always@(posedge my_clk)begin
		move=move+1;
		
        if(up==1'b0)begin 
        count=count-1; //right
				if(move[14]==1'b1)begin             				
                    count=count+1;
                     move[14]=0;     
				end 
						case(count)
							3'b000:in = 4'b1111;
							3'b001:in = 4'b0010;
							3'b010:in = 4'b0111;
							3'b011:in = 4'b0001;
							3'b100:in = 4'b0000;
							3'b101:in = 4'b0001;
							3'b110:in = 4'b0110;
							3'b111:in = 4'b0000;
						endcase
            
						enable[7]<=enable[0];
            enable[6]<=enable[7];
            enable[5]<=enable[6];
            enable[4]<=enable[5];
            enable[3]<=enable[4];
            enable[2]<=enable[3];
            enable[1]<=enable[2];
            enable[0]<=enable[1]; 
                  
        end       
        else begin  //left
        count=count+1; 
				if(move[14]==1'b1)begin            
					 	count=count-1;
					 	move[14]=0; 		 
				end
				
						case(count)
							3'b000:in = 4'b1111;
              3'b001:in = 4'b0010;
              3'b010:in = 4'b0111;
              3'b011:in = 4'b0001;
              3'b100:in = 4'b0000;
              3'b101:in = 4'b0001;
              3'b110:in = 4'b0110;
              3'b111:in = 4'b0000;
						endcase
				        enable[7]<=enable[6];
                enable[6]<=enable[5];
                enable[5]<=enable[4];
                enable[4]<=enable[3];
                enable[3]<=enable[2];
                enable[2]<=enable[1];
                enable[1]<=enable[0];
                enable[0]<=enable[7];
                 
           
        end
     end  
  //logic function of 7-segment-display                                                         
  assign a = (~in[3] & ~in[2]& ~in[1] &  in[0])|( in[2] & ~in[0])|(in[3] & in[1]);
	assign b = ( in[2] & ~in[1]&  in[0])|( in[2] &  in[1] & ~in[0])|(in[3] & in[1]);
  assign c = (~in[2] &  in[1]& ~in[0])|( in[3] &  in[2]);
	assign d = (~in[2] & ~in[1]&  in[0])|( in[2] & ~in[1] & ~in[0])|(in[2] & in[1] & in[0]);
	assign e = ( in[0])|( in[2]& ~in[1]);             
	assign f = (~in[3] & ~in[2]&  in[0])|(~in[2] &  in[1])|( in[1] & in[0]);
	assign g = (~in[3] & ~in[2]& ~in[1])|( in[2] &  in[1] &  in[0]);   
  assign dp=1'b1;// dot                                         
endmodule




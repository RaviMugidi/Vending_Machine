`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:08 09/20/2022 
// Design Name: 
// Module Name:    vending_machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vending_machine(sel_product,coin,clk,rst,change,product);

  input [1:0]sel_product,coin;
  input clk,rst;
  output reg product,change;
  
  parameter no_item =2'b00;// No item selected
  parameter candy=2'b01;  // candy cost Rs.5
  parameter cake=2'b10;   // cake cost Rs.10
  parameter cooldrink=2'b11; //cooldrink cost=Rs.15
  
  parameter w=2'b00;     //no money deposit
  parameter x=2'b01;    //Rs.5 deposited
  parameter y=2'b10;   //Rs.10 deposited 
  parameter z=2'b11;  // Rs.20 deposited
  
  reg [1:0]state;
  
 // parameter p=2'b00;
  //parameter q=2'b01;
  //parameter r=2'b10;
  //parameter s=2'b11;
  
  parameter idle=2'b00;  //idle state
  parameter a=2'b01;     // Rs.5 state
  parameter b=2'b10;    //Rs.10 state
  parameter c=2'b11;  //Rs.15 state 
  
  reg [1:0] pro;
  
  //initial state <=idle;
  
/*always@(posedge clk)   
  begin
     if(product)
	  begin 
	    {product,change}<=2'b00;
	  end
	  
  end  
*/
always@(posedge clk)	
  begin
   if(rst)
	  begin
	     state<=idle;
	     {product,change}<=2'b00;
	  end
	  else
	  begin
     case(sel_product) 
	      no_item:
			    begin
				    {product,change}<=2'b00;
				 end
			candy:begin
			        case(state)
					     idle:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
								 else if(coin==x)//
								  begin
								    {product,change} <=2'b10;
									 state <=idle;
								  end
								 else if(coin==y)//
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle; 
								  end
								else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
						default :begin
							     {product,change }<= 2'b00;
					           state <= idle;
								  end							   
					  endcase					  
			      end
			cake:begin
			       case(state)
					     a:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=a;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b00;
									 state <=b;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b10;
									 state <=idle;
								  end
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
						    end
							 
						  b:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=b;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b10;
									 state <=idle;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								//if(z)
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								 else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
						idle:begin
							if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b00;
									 state <=a;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b10;
									 state <=b;
								  end
								//if(z)
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
						default:begin
							     {product,change }<= 2'b00;
								  state<=idle;
								end
					  endcase
			     end
			cooldrink:begin
			       case(state)
					     a:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=a;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b00;
									 state <=b;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b00;
									 state <=c;
								  end
								//if(z)
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
							 
						  b:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=b;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b00;
									 state <=c;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b10;//2'b10
									 state <=idle;
								  end
								//if(z)
								else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
						  c:begin
						      if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=c;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b10;
									 state <=idle;
								  end
								 else if(coin==y)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								 //if(z)
								 else if(coin==z)
								  begin
								    {product,change} <=2'b11;
									 state <=idle;
								  end
								 else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
							 idle:begin
								if(coin==w)
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
								else if(coin==x)
								  begin
								    {product,change} <=2'b00;
									 state <=a;
								  end
								else if(coin==y)
								  begin
								    {product,change} <=2'b00;
									 state <=b;
								  end
								//if(z)
								else if(coin==z)
								  begin
								    product<=1'b1;
									 change <=1'b1;
									 state <=idle;
								  end
								else
								  begin
								    {product,change} <=2'b00;
									 state <=idle;
								  end
						    end
						default:begin
							     {product,change }<= 2'b00;
								  state<=idle;
							  end
						
					  endcase
			     end			
	  endcase
	  end
  end

  
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:48 09/20/2022
// Design Name:   vending_machine
// Module Name:   C:/Users/Ravi/Xilinx/Sriram/tb_vendin_machine.v
// Project Name:  Sriram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vending_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_vendin_machine;

	// Inputs
	reg [1:0] sel_product;
	reg [1:0] coin;
	reg clk,rst;

	// Outputs
	wire change;
	wire product;
	
	initial clk=0;
	always@(clk) #10 clk<=~clk;

	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.sel_product(sel_product), 
		.coin(coin), 
		.clk(clk), 
		.rst(rst), 
		.change(change), 
		.product(product)
	);
	
	task reset();
	begin
		@(negedge clk)
		  rst <=1'b1;
		@(negedge clk)
		  rst <=1'b0;
	end
	endtask
	
	task product_selection(input [1:0]a);
	begin
		@(negedge clk)
		  sel_product <=a;
		@(negedge clk);
	end
	endtask
	
	task coin_selection(input [1:0]b);
	begin
		@(negedge clk)
		  coin <=b;
		@(negedge clk);
	end
	endtask
	initial begin
    /*#15 sel_product =2'b00;
	 #10 coin =10;
	 @(negedge clk) rst=1'b1;
	 @(negedge clk) rst =1'b0;
	 @(negedge clk) sel_product=2'b01; 
	 //#10 coin =2'b10;
	 @(negedge clk) coin =2'b11;
	 @(negedge clk);
	 @(negedge clk) coin=2'b10; 
	 @(negedge clk) rst=1'b1;
	 @(negedge clk) rst=1'b0;
	 #200 sel_product = 2'b10;
	 @(negedge clk) coin =2'b01;
	 @(negedge clk) coin =2'b10;
	 */
	 
	 reset;
	  product_selection(2'b10);
	  coin_selection(2'b01);
	  coin_selection(2'b01);
	  coin_selection(2'b00);
	 #1000 $finish;
	 
	end
      
endmodule

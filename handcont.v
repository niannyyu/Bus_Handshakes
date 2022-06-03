`timescale 1ns / 1ps



module handcont#( parameter L = 8)(
	input clk,
	input rst,
	input ven,
	input ren,
	input [L-1:0] data_in,
	output [L-1:0] data_f,
	output [L-1:0] data_b,
	output [L-1:0] data_m,
	output [L-1:0] data_out
	);
	
	wire ready_f;
	wire valid_f;
  
	wire valid_b;
	wire ready_b;

	wire valid_m;
	wire ready_m;
	//wire [L-1:0] data_m;
//-----------------------------------------------------------------------------
master #(
			.L(L)
		) inst_master (
			.clk   (clk),
			.rst   (rst),
			.ven   (ven),
			.ready (ready_f),
			.valid (valid_f),
			
			.data_out  (data_f)
			
		);


	forwardpipe #(
			.L(L)
		)inst_forwardpipe (
			.clk     (clk),
			.rst   (rst),
			
			.ready_f (ready_f),
			.valid_f  (valid_f),
			.data_f (data_f),
			
			.ready_b (ready_m),
			.valid_b  (valid_m),
			.data_b (data_m)
		);


	backwardskidbuffer #(
			.L(L)
		) inst_backwardpipe (
			.clk     (clk),
			.rst   (rst),
			
			.ready_f (ready_m),
			.valid_f  (valid_m),
			.data_f (data_m),
			
			.ready_b (ready_b),
			.valid_b  (valid_b),
			.data_b (data_b)
		);

	salve #(
			.L(L)
		) inst_salve (
			.clk        (clk),
			.rst        (rst),
			.ren         (ren),
			.valid    (valid_b),
			.data_in  (data_b),
			.ready    (ready_b),
			.data_out (data_out)
		);

  //------------------------------------------------------------------------
/*master #(
			.L(L)
		) inst_master (
			.clk   (clk),
			.rst   (rst),
			.ven   (ven),
			.ready (ready_m),
			.valid (valid_m),
			
			.data_out  (data_m)
			
		);
		salve #(
			.L(L)
		) inst_salve (
			.clk        (clk),
			.rst        (rst),
			.ren         (ren),
			.valid    (valid_m),
			.data_in  (data_m),
			.ready    (ready_m),
			.data_out (data_out)
		);

  //------------------------------------------------------------------------
  //Q2*/
/*master #(
			.L(L)
		) inst_master (
			.clk   (clk),
			.rst   (rst),
			.ven   (ven),
			.ready (ready_f),
			.valid (valid_f),
			
			.data_out  (data_f)
			
		);
			forwardpipe #(
			.L(L)
		)inst_forwardpipe (
			.clk     (clk),
			.rst   (rst),
			
			.ready_f (ready_f),
			.valid_f  (valid_f),
			.data_f (data_f),
			
			.ready_b (ready_b),
			.valid_b  (valid_b),
			.data_b (data_b)
		);
		salve #(
			.L(L)
		) inst_salve (
			.clk        (clk),
			.rst        (rst),
			.ren         (ren),
			.valid    (valid_b),
			.data_in  (data_b),
			.ready    (ready_b),
			.data_out (data_out)
		);
		 //------------------------------------------------------------------------
  //Q4
 
master #(
			.L(L)
		) inst_master (
			.clk   (clk),
			.rst   (rst),
			.ven   (ven),
			.ready (ready_f),
			.valid (valid_f),
		    .data_out  (data_f)
			
		);
		backwardpipe #(
			.L(L)
		) inst_backwardpipe (
			.clk     (clk),
			.rst   (rst),
			
			.ready_f (ready_f),
			.valid_f  (valid_f),
			.data_f (data_f),
			
			.ready_b (ready_b),
			.valid_b  (valid_b),
			.data_b (data_b));
			
		salve #(
			.L(L)
		) inst_salve (
			.clk        (clk),
			.rst        (rst),
			.ren         (ren),
			.valid    (valid_b),
			.data_in  (data_b),
			.ready    (ready_b),
			.data_out (data_out)
		)*/
endmodule

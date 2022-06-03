`timescale 1ns / 1ps


module tb_hands( );


	parameter L = 8;

	reg clk;
	reg rst;
	reg ren;
    reg ven;
	reg [L-1:0] m_data_in;
	wire [L-1:0] m_data_out;
	wire [L-1:0] s_data_in;
	wire [L-1:0] s_data_out;

	initial begin
		clk = 1'b1;
		while (1)
		#5 clk = ~clk;	
	end

	initial begin
		 rst = 1'b0;
		#20 rst= 1'b1;
	end
initial begin
		     ven = 1'b0;
		#25  ven = 1'b1;
		#80  ven = 1'b0;//140
		#55  ven = 1'b1;
		#100 ven = 1'b0;
		
	end

	initial begin
		    ren = 1'b0;
		#20 ren = 1'b1;
		#100 ren = 1'b0;//150
		#60ren = 1'b1;//200
		#50	 ren = 1'b0;
		#60  ren = 1'b1;
		
	end
	
	initial begin
		    m_data_in = 8'h08;
		#10 m_data_in = 8'h56;
		#10 m_data_in = 8'ha8;
		#10	 m_data_in = 8'h37;
		#10	 m_data_in = 8'hbe;
		#10  m_data_in =8'h33;
		#10 m_data_in = 8'ha8;
		#10	 m_data_in = 8'hf7;
		#10	 m_data_in = 8'hce;
		#10  m_data_in =8'h22;
		#10	 m_data_in = 8'hbe;
		#10  m_data_in =8'h33;
		#10 m_data_in = 8'ha8;
		#10	 m_data_in = 8'hf7;
		#10	 m_data_in = 8'hce;
		#10  m_data_in =8'h22;
	    #10 m_data_in = 8'ha8;
		#10	 m_data_in = 8'hf7;
		#10	 m_data_in = 8'hce;
		#10  m_data_in =8'h22;
		#10	 m_data_in = 8'hbe;
		#10  m_data_in =8'h33;
		#10	 m_data_in = 8'hbe;
		#10  m_data_in =8'h33;
		#10 m_data_in = 8'ha8;
		#10	 m_data_in = 8'hf7;
		
		
	end
	
	handcont inst_handcont
	(.clk(clk), 
	.rst(rst),
    .ven(ven),
	 .ren(ren),
	 .data_in(m_data_in),
	 .data_f(m_data_out),
	 //.data_m(m_data_out),
	 .data_b(s_data_in),
	 .data_out(s_data_out));

endmodule

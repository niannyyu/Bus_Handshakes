`timescale 1ns / 1ps



module salve#( parameter L= 8)(
	input clk,
	input rst,
	input ren,
	input valid,
	output reg ready,
	input [L-1:0] data_in,
	output reg [L-1:0] data_out
	
);
always @(posedge clk or negedge rst) begin
		if (!rst) begin
			ready <= 1'b0;
		end
		else begin
			ready <=  ren;
		end
	end
always @(posedge clk or negedge rst) begin
		if (!rst) 
			data_out <= {L{1'b0}};
		  else if (valid && ready) 
			data_out <= data_in;
		else 
            data_out <= {L{1'b1}};
		end
endmodule

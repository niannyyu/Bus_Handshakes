`timescale 1ns / 1ps



module forwardpipe #(parameter L=8)(
    input clk,
	input rst,
	
	output  ready_f,
	input valid_f,
	input [L-1:0] data_f,
	
	input  ready_b,
	output reg valid_b,
	output reg [L-1:0] data_b
	
);
always @(posedge clk or negedge rst) begin
		if (!rst)begin
			valid_b <= 1'b0;
			end
			else begin
			valid_b<=ready_f? valid_f:valid_b;
			end
		end
		always @(posedge clk or negedge rst) begin
		if (!rst)begin
			data_b <= {L{1'b0}};
			end
			else begin
			data_b<=ready_f? data_f:data_b;
			end
		end
		
assign ready_f =ready_b || ~valid_b;
endmodule

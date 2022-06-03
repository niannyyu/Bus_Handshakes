`timescale 1ns / 1ps



module backwardskidbuffer#(parameter L=8,
	parameter OPTREG = 0 )(

    input clk,
	input rst,
	
	output reg ready_f,
	input valid_f,
	input  [L-1:0] data_f,
	
	input  ready_b,
	output  reg valid_b,
	output  reg [L-1:0] data_b       
) ;
reg state;
wire ready  ;          
reg pre_valid;
reg [L-1:0] data_pre;
//reg buffer_valid;
//reg [L-1:0] data_buffer;       
//reg  ready_buffer;        
      

always @(posedge clk) begin 
   if (!rst) begin
      state <= 0 ;
       end
   else if(!state) begin          
            if (ready) begin
             valid_b<=valid_f;
			data_b<=data_f;  
               ready_f <= 1'b1    ;               
            end
            else begin
              pre_valid<=valid_f;
			data_pre<=data_f;
               ready_f <= 1'b0    ;
               state<= !state ;
            end

         end
              
         else   if (ready) begin
             valid_b<=pre_valid;
			data_b<=data_pre;              
               ready_f <= 1'b1;
               state <= !state;               
            end

         end

   

//assign ready_f  = ready_buffer ;
//assign data_b  = data_buffer;
//assign valid_b  = buffer_valid;   
assign ready   = ready_b || ! valid_b ;
        

endmodule
	
	//assign store =~ready_b && ready_f && valid_f&& valid_b;//有传入的数据，下游没准备好
	/*always @(posedge clk or negedge rst) begin
	//tim=0;
		if (!rst)begin
			buffer_valid <= 1'b0;
			
			end
			
			else if(store) begin
			buffer_valid<=1'b1;
			end
			else if(ready_f) begin
			buffer_valid<=1'b0;
			end
		end
	always @(posedge clk or negedge rst) begin
	tim=0;
	#3 tim=1;
	end
	always @(posedge clk or negedge rst) begin
		if (!rst)begin
			data_buffer <= {L{1'b0}};
			end
			else begin
			data_buffer<=store? data_f:data_buffer;
			
			end
		end
		always @(posedge clk or negedge rst) begin
		if (!rst)begin
			ready_f <= 1'b1;
			end
			else begin
			ready_f<=(~buffer_valid&&~store)||ready_b;
			end
		end
		always @(*) begin
		data_b <= ready_f ? data_f : data_buffer; 
		valid_b <=  valid_f || buffer_valid ;
		end*/
		
	//assign  valid_b <= ready_f ? valid_f : buffer_valid;    
    //assign data_b <= ready_f ? data_f : data_buffer;
	/*	always@(posedge clk)begin
            if(!rst)
            valid_b <= 1'b0;
            else if(ready_f && valid_f)
            valid_b <= valid_f;
            else
            valid_b<=buffer_valid;
            end

		always@(posedge clk)begin
            if(!rst)
            data_b <=8'b0;
            else if(!valid_b)
            data_b <= data_b;
            else
            data_b = ready_f ? data_f : data_buffer;
            end*/

    

//endmodule

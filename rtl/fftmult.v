module fftmult(clk, rst, a, b, o);
   parameter CWIDTH = 18;
   parameter IWIDTH = 18;
   parameter OWIDTH = (IWIDTH)+CWIDTH;
   parameter CREP = 18-(CWIDTH - 1);
   parameter IREP = 18-(CWIDTH - 1);
   input clk;
   input rst;
   input signed [(CWIDTH-1):0] a;
   input signed [(IWIDTH-1):0] b;
   output signed [(OWIDTH-1):0] o;
   initial
     $display("IWIDTH: %d, CWIDTH: %d", IWIDTH, CWIDTH);

   wire signed [17:0] 			   a_wire = a;
   wire signed [17:0] 			   b_wire = b;
   wire signed [35:0] 			   mult_output;
   assign o = mult_output[OWIDTH-1:0];

   // assign o = a_wire*b_wire;
   // always @(a,b,o)
   //   $display("%d * %d = %d", a, b, o);
   mult18x18_1c mult(
   		     // Outputs
   		     .O			(mult_output),
   		     // Inputs
   		     .clk		(clk),
   		     .en		(1'b1),
   		     .rst		(rst),
   		     .A			(a_wire),
   		     .B			(b_wire));
endmodule // fftmult

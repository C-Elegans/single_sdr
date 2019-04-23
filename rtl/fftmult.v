module fftmult(clk, a, b, o);
   parameter CWIDTH = 18;
   parameter IWIDTH = 18;
   parameter CREP = 18-(CWIDTH - 1);
   parameter IREP = 18-(CWIDTH - 1);
   input clk;
   input signed [(CWIDTH-1):0] a;
   input signed [(IWIDTH-1):0] b;
   output signed [((IWIDTH+1)+CWIDTH-1):0] o;
   initial
     $display("IWIDTH: %d, CWIDTH: %d", IWIDTH, CWIDTH);

   wire signed [17:0] 			   a_wire = a;
   wire signed [17:0] 			   b_wire = b;

   // assign o = a_wire*b_wire;
   // always @(a,b,o)
   //   $display("%d * %d = %d", a, b, o);
   mult18x18_0c mult(
   		     // Outputs
   		     .O			(o),
   		     // Inputs
   		     .clk		(clk),
   		     .en		(1'b1),
   		     .rst		(1'b0),
   		     .A			(a_wire),
   		     .B			(b_wire));
endmodule // fftmult

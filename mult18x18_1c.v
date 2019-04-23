module mult18x18_1c(/*AUTOARG*/
    // Outputs
    O,
    // Inputs
    clk, en, rst, A, B
    );
    input clk;
    input en;
    input rst;
    input [17:0] A;
    input [17:0] B;
    output [35:0] O;

    /* verilator lint_off PINMISSING */
    MULT18X18D  #(
    .CLK3_DIV("ENABLED"),
    .CLK2_DIV("ENABLED"),
    .CLK1_DIV("ENABLED"),
    .CLK0_DIV("ENABLED"),
    .HIGHSPEED_CLK("NONE"),
    .REG_INPUTC_RST("RST0"),
    .REG_INPUTC_CE("CE0"),
    .REG_INPUTC_CLK("NONE"),
    .SOURCEB_MODE("B_SHIFT"),
    .MULT_BYPASS("DISABLED"),
    .CAS_MATCH_REG("FALSE"),
    .RESETMODE("SYNC"),
    // .REG_INPUTA_RST("RST0"),
    // .REG_INPUTA_CE("CE0"),
    // .REG_INPUTA_CLK("CLK0"),
    // .REG_INPUTB_RST("RST0"),
    // .REG_INPUTB_CE("CE0"),
    // .REG_INPUTB_CLK("CLK0"),
    .REG_OUTPUT_RST("RST0"),
    .REG_OUTPUT_CE("CE0"),
    .REG_OUTPUT_CLK("CLK0"),
    // .REG_PIPELINE_RST("RST0"),
    // .REG_PIPELINE_CE("CE0"),
    // .REG_PIPELINE_CLK("CLK0"),
    .GSR("DISABLED"))
dsp_mult_0(
		 // Outputs
		 .SROA8			(),
		 .SROA7			(),
		 .SROA6			(),
		 .SROA5			(),
		 .SROA4			(),
		 .SROA3			(),
		 .SROA2			(),
		 .SROA1			(),
		 .SROA0			(),
		 .SROB8			(),
		 .SROB7			(),
		 .SROB6			(),
		 .SROB5			(),
		 .SROB4			(),
		 .SROB3			(),
		 .SROB2			(),
		 .SROB1			(),
		 .SROB0			(),
		 .ROA8			(),
		 .ROA7			(),
		 .ROA6			(),
		 .ROA5			(),
		 .ROA4			(),
		 .ROA3			(),
		 .ROA2			(),
		 .ROA1			(),
		 .ROA0			(),
		 .ROB8			(),
		 .ROB7			(),
		 .ROB6			(),
		 .ROB5			(),
		 .ROB4			(),
		 .ROB3			(),
		 .ROB2			(),
		 .ROB1			(),
		 .ROB0			(),
		 .ROC8			(),
		 .ROC7			(),
		 .ROC6			(),
		 .ROC5			(),
		 .ROC4			(),
		 .ROC3			(),
		 .ROC2			(),
		 .ROC1			(),
		 .ROC0			(),
		 .P35			(O[35]),
		 .P34			(O[34]),
		 .P33			(O[33]),
		 .P32			(O[32]),
		 .P31			(O[31]),
		 .P30			(O[30]),
		 .P29			(O[29]),
		 .P28			(O[28]),
		 .P27			(O[27]),
		 .P26			(O[26]),
		 .P25			(O[25]),
		 .P24			(O[24]),
		 .P23			(O[23]),
		 .P22			(O[22]),
		 .P21			(O[21]),
		 .P20			(O[20]),
		 .P19			(O[19]),
		 .P18			(O[18]),
		 .P17			(O[17]),
		 .P16			(O[16]),
		 .P15			(O[15]),
		 .P14			(O[14]),
		 .P13			(O[13]),
		 .P12			(O[12]),
		 .P11			(O[11]),
		 .P10			(O[10]),
		 .P9			(O[9]),
		 .P8			(O[8]),
		 .P7			(O[7]),
		 .P6			(O[6]),
		 .P5			(O[5]),
		 .P4			(O[4]),
		 .P3			(O[3]),
		 .P2			(O[2]),
		 .P1			(O[1]),
		 .P0			(O[0]),
		 .SIGNEDP		(),
		 // Inputs
		 .A17			(A[17]),
		 .A16			(A[16]),
		 .A15			(A[15]),
		 .A14			(A[14]),
		 .A13			(A[13]),
		 .A12			(A[12]),
		 .A11			(A[11]),
		 .A10			(A[10]),
		 .A9			(A[9]),
		 .A8			(A[8]),
		 .A7			(A[7]),
		 .A6			(A[6]),
		 .A5			(A[5]),
		 .A4			(A[4]),
		 .A3			(A[3]),
		 .A2			(A[2]),
		 .A1			(A[1]),
		 .A0			(A[0]),
		 .B17			(B[17]),
		 .B16			(B[16]),
		 .B15			(B[15]),
		 .B14			(B[14]),
		 .B13			(B[13]),
		 .B12			(B[12]),
		 .B11			(B[11]),
		 .B10			(B[10]),
		 .B9			(B[9]),
		 .B8			(B[8]),
		 .B7			(B[7]),
		 .B6			(B[6]),
		 .B5			(B[5]),
		 .B4			(B[4]),
		 .B3			(B[3]),
		 .B2			(B[2]),
		 .B1			(B[1]),
		 .B0			(B[0]),
		 .C17			(1'b0),
		 .C16			(1'b0),
		 .C15			(1'b0),
		 .C14			(1'b0),
		 .C13			(1'b0),
		 .C12			(1'b0),
		 .C11			(1'b0),
		 .C10			(1'b0),
		 .C9			(1'b0),
		 .C8			(1'b0),
		 .C7			(1'b0),
		 .C6			(1'b0),
		 .C5			(1'b0),
		 .C4			(1'b0),
		 .C3			(1'b0),
		 .C2			(1'b0),
		 .C1			(1'b0),
		 .C0			(1'b0),
		 .SIGNEDA		(1'B1),
		 .SIGNEDB		(1'B1),
		 .SOURCEA		(1'B0),
		 .SOURCEB		(1'B0),
		 .CE0			(en),
		 .CE1			(1'b1),
		 .CE2			(1'b1),
		 .CE3			(1'b1),
		 .CLK0			(clk),
		 .CLK1			(1'b0),
		 .CLK2			(1'b0),
		 .CLK3			(1'b0),
		 .RST0			(rst),
		 .RST1			(1'b0),
		 .RST2			(1'b0),
		 .RST3			(1'b0),
		 .SRIA8			(),
		 .SRIA7			(),
		 .SRIA6			(),
		 .SRIA5			(),
		 .SRIA4			(),
		 .SRIA3			(),
		 .SRIA2			(),
		 .SRIA1			(),
		 .SRIA0			(),
		 .SRIB8			(),
		 .SRIB7			(),
		 .SRIB6			(),
		 .SRIB5			(),
		 .SRIB4			(),
		 .SRIB3			(),
		 .SRIB2			(),
		 .SRIB1			(),
		 .SRIB0			());

endmodule // mult9x9

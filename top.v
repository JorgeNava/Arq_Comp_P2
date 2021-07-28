module top (
	input [3:0] ubInputData,
	input [3:0] ubCredential,
	input clk,
	output LEDstatus,
	output [3:0]ubCounter
);

wire [3:0]wIA;
wire [3:0]wIB;
wire [4:0]wR;
wire [4:0]wStatus;
wire [3:0]wOp;

ControlUnit uc(
	 .status(wStatus), // zeros, negativo, carry, overflow, paridad 
	 .R(wR),
	 .ubInputData(ubInputData),
	 .ubCredential(ubCredential),
	 .clk(clk),
	 .iA(wIA),
	 .iB(wIB),
	 .Op(wOp), 
	 .LEDstatus(LEDstatus),
	 .ubCounter(ubCounter)
);

Practica2 alu(
	.iA(wIA),
	.iB(wIB),
	.Op(wOp),
	.Status(wStatus),
	.R(wR)
);

endmodule
`timescale 1ns / 1ps
module finalTest ();

reg [3:0]ubInputData;
reg [3:0]ubCredential;
reg clk = 0;
wire LEDstatus;
wire [3:0]ubCounter;

top tp(
	.ubInputData(ubInputData),
	.ubCredential(ubCredential),
	.clk(clk),
	.LEDstatus(LEDstatus),
	.ubCounter(ubCounter)
);


always
begin 
	forever 
		begin
		clk = ~clk;
		#1;
		end
end

initial
begin
	#2 
			ubInputData = 4'd2;
			ubCredential = 4'd0;
			while(ubCredential < 18)
			begin
				#10 ubCredential = ubCredential + 4'b0001;
				
			end
			
	#10
	#2 
			ubInputData = 4'd5;
			ubCredential = 4'd5;

	#100
	$display("Fin de simulación");
	$stop;
end

endmodule
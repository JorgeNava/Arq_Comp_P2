`timescale 1ns / 1ps
module test ();

reg [3:0]iA;
reg [3:0]iB;
reg [3:0]Op;
wire [3:0]R;
wire [4:0]Status;

UnidadAritmetica ALU(
	.iA								(iA), 
	.iB								(iB), 
	.Op								(Op),
	.Status							(Status),
	.R									(R)
);
initial
begin
	#2 
			iA = 4'd7;
			iB = 4'd1;
			Op = 4'd0;
			while(Op < 13)
			begin
				#5 Op = Op + 4'b0001;
				
			end
	#10
	#2 
			iA = -4'd7;
			iB = -4'd1;
			Op = 4'd0;
			while(Op < 13)
			begin
				#5 Op = Op + 4'b0001;
				
			end
	#10
	
	#2 	iA = 4'd7;
			iB = 4'd5;
			Op = 4'd13;
	#10
	#2 	iA = 4'd14;
			iB = 4'd14;
			Op = 4'd13;
	#10
	#2 	iA = 4'd3;
			iB = 4'd3;
			Op = 4'd0;
	#10
	#2 	iA = 4'd3;
			iB = 4'd7;
			Op = 4'd0;
	#10
	#2 	iA = 4'd2;
			iB = 4'd12;
			Op = 4'd0;
	#10
	#2 	iA = 4'd8;
			iB = 4'd1;
			Op = 4'd9;
	#10
	#2 	iA = 4'd8;
			iB = 4'd1;
			Op = 4'd11;
	#10
	#2 	iA = 4'd8;
			iB = 4'd1;
			Op = 4'd8;
	#10
	#2 	iA = 4'd10;
			iB = 4'd7;
			Op = 4'd1;
	#10
	#2 	iA = 4'd0;
			Op = 4'd3;
	#10
	#2 	iA = 4'd0;
			iB = 4'd15;
			Op = 4'd4;
	#10
	$display("Fin de simulación");
	$stop;
end

endmodule
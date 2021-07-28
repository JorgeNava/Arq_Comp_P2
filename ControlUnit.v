module ControlUnit (
	input [4:0] status, // zeros, negativo, carry, overflow, paridad 
	input [4:0] R,
	input [3:0] ubInputData,
	input [3:0] ubCredential,
	input clk,
	output [3:0] iA,
	output [3:0] iB,
	output [3:0] Op,
	output LEDstatus,
	output [3:0]ubCounter

);


reg [2:0]pc = 3'd0;
reg temp_LEDstatus = 4'd0;
reg [3:0]temp_ubCounter = 4'd0;
reg [3:0] temp_iA = 4'd0;
reg [3:0] temp_iB = 4'd0;
reg [3:0] temp_Op = 4'd0;

always @(posedge clk)
begin
	case (pc)
		   0:		//restamos ubInputData - ubCredentials y pasamos al estado 1
				begin
					temp_iA = ubInputData;
					temp_iB = ubCredential;
					temp_Op = 4'd0;
					pc = 3'd1;
				end
			1:		//mandar a llamar a la ALU para comparar numeros  (if (ubInputData < ubCredential)), TRUE: estado 2/ FALSE: estado 3
				begin
				
					//	2 y 11, solo carry - no funciona - 1 0111
					//	2 y 10/7, neg,carry,over - si funciona - 1 1000
					//	2 y 1/0, ninguna flag, si funciona 0 0001				
					// (carry and !over) or neg
					
					if((status[2] == 1  & status[1] == 0) | status[3] == 1) // 
						pc = 3'd2;
					else 
						pc = 3'd3;
				end
			2:		// sumar 1 a ubCounter con ALU, ir a estado 6
				begin
					temp_iA = ubCounter;
					temp_iB = 4'd1;
					temp_Op = 4'd13;
					pc = 3'd6;
				end	
			3:		// Comparar dos valores con ALU (else if (ubInputData == ubCredential)), TRUE: estado 4/ FALSE: estado 5
				begin
					if(status[4] == 1)
						pc = 3'd4;
					else 
						pc = 3'd5;
				end
			4:		// Prender LED, ir al estado 7
				begin
					temp_LEDstatus = 1;
					pc = 3'd0;
					  
				end	
			5:		//restar 1 a ubCounter con ALU, ir al estado 6
				begin
					temp_iA = ubCounter;
					temp_iB = 4'd1;
					temp_Op = 4'd0;
					pc = 3'd6;
				end
			
			6: 	// guardar el valor que devuelve la ALU a ubCounter
				begin
					temp_ubCounter = R[3:0];
					pc = 3'd0;
				end			
	endcase
end

assign iA = temp_iA;
assign iB = temp_iB;
assign Op = temp_Op;
assign LEDstatus = temp_LEDstatus; 
assign ubCounter = temp_ubCounter;

endmodule
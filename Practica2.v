module Practica2(
	input [3:0] iA,
	input [3:0] iB,
	input [3:0] Op,
	output [4:0] Status,
	output [4:0] R

);

reg [4:0] temp = 5'd0;

always @(*)
begin
	temp = 0;
	case (Op)
			0: 	temp = iA - iB;					//Resta
			1: 	temp = iA & iB;					//And
			2:		temp = iA | iB;					//Or
			3: 	temp = ~iA;							//Not
			4: 	temp = iA ^ iB;					//XOr
			5: 	temp = ~iA;							//Complemento a 1
			6: 	temp = ~iA  + 4'b0001;			//Complemento a 2
			7: 	begin
						temp[3:1] = iA[2:0];			//Recorrimiento arit izquierda
						temp[0] = 0;
					end
			8: 	begin
						temp[3] = iA[3];				//Recorrimiento arit derecha
						temp[2:0] = iA[3:1];
					end
			9: 	begin
						temp[3:1] = iA[2:0];			//Recorrimiento log izquierda
						temp[0] = 0;
					end
			10:	begin
						temp[3] = 0;					//Recorrimiento log derecha
						temp[2:0] = iA[3:1];
					end
			11:	begin
						temp[0] = iA[3];				//Recorrimiento circular izquierda
						temp[3:1] = iA[2:0];
					end
			12:	begin
						temp[3] = iA[0];				//Recorrimiento circular derecha
						temp[2:0] = iA[3:1];
					end
			13:	temp = iA + iB;					//Suma
	endcase
end



assign Status[4] = temp == 0;
assign Status[3] = temp[3];
assign Status[2] = temp[4];


assign Status[1] = (temp[3:0] > 4'd7);
//assign Status[1] = ~((temp[3:0] < 4'd7) && (temp[3:0] > (0-8)));
//assign Status[1] =  (temp[4:3] == 2'b01);


assign Status[0] = ~^temp[3:0];

assign R = temp[3:0];



endmodule
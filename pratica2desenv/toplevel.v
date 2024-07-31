module toplevel(SW,KEY,LEDR,LEDG,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, q,r0, r1, r2, r3, r7);


 pratica2 PROCESSADOR(.clock(KEY[3]), .din(SW[7:0]), .run(1'b1), .resetn(1'b0), .saida(q), .donet(LEDR[0]), .r7t(r7),
							.r0t(r0), .r1t(r1), .r2t(r2), .r3t(r3));
	
 input [17:0]SW;
 output [15:0]q,r0, r1, r2, r3, r7;
 output [17:0]LEDR;
 output [7:0]LEDG;
 input [3:0]KEY;
 output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7; 
 //Mostrando dados de entrada
	//decodificador h_valor(SW[3:0],HEX7[0:6]);
	decodificador h_din(SW[3:0],HEX6[0:6]);
	decodificador h_contador(r7[3:0],HEX5[0:6]);
	decodificador h_r3(r3[3:0],HEX3[0:6]);
	decodificador h_r2(r2[3:0],HEX2[0:6]);
	decodificador h_r1(r1[3:0],HEX1[0:6]);
	decodificador h_r0(r0[3:0],HEX0[0:6]);
	
endmodule
	
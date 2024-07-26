module toplevel(SW,KEY,LEDR,LEDG,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, q);


 pratica2 PROCESSADOR(.clock(KEY[3]), .din(SW[7:0]), .run(1'b1), .resetn(1'b0), .q(q), .donet(LEDR[0]));
	
 input [17:0]SW;
 output [15:0]q;
 output [17:0]LEDR;
 output [7:0]LEDG;
 input [3:0]KEY;
 output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7; 
 //Mostrando dados de entrada
	decodificador h_valor(SW[8],HEX7[0:6]);
	decodificador h2_valor(SW[7:4],HEX6[0:6]);
	decodificador h3_valor(SW[3:0],HEX5[0:6]);
	decodificador h_saida(q[15:12],HEX3[0:6]);
	decodificador h1_saida(q[11:8],HEX2[0:6]);
	decodificador h2_saida(q[7:4],HEX1[0:6]);
	decodificador h3_saida(q[3:0],HEX0[0:6]);
	
endmodule
	
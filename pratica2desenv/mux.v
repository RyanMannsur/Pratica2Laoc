module mux(din, r0, r1, r2, r3, r4, r5, r6, r7, 
r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out,
 G, g_out, dinout, buswires);		
//Mux do registrador, a ideia aqui é que ao entrar com um valor
//o mux defina qual registrador vai para o bus

	input dinout, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, g_out;
	input [15:0] din, r0, r1, r2, r3, r4, r5, r6, r7, G;
	output reg[15:0] buswires;
	
	always @(*) begin
        case (1'b1)
				dinout: buswires = din;
				r0_out: buswires = r0;
				r1_out: buswires = r1;
				r2_out: buswires = r2;
				r3_out: buswires = r3;
				r4_out: buswires = r4;
				r5_out: buswires = r5;
				r6_out: buswires = r6;
				r7_out: buswires = r7;
				g_out: buswires = G;
        endcase
    end

endmodule

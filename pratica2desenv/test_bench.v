module test_bench;



	reg clock, run, resetn;
	reg [15:0] din;
	wire [15:0] q, r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t, At, Gt,add_sub_outt, buswiret;
	wire r0_int, r1_int, r2_int, r3_int, r4_int, r5_int, r6_int, r7_int;
   wire r0_outt, r1_outt, r2_outt, r3_outt, r4_outt, r5_outt, r6_outt, r7_outt, g_outt, dinoutt;
   wire a_int, g_int, add_subt, donet;
	wire [8:0]irt;

	
	initial begin
		resetn = 1'b0;
		run = 1'b1;
		din = 16'b0000000000000010; // 2
	end
	
	initial begin
		#25 clock = 1'b1;//1
		#25 clock = 1'b0; // 0
		
		#25 clock = ~clock;  //1
		
		#25 clock = 1'b0;//0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1

	end
	
		pratica2 dut(clock, din, run, resetn, q,r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t, At, Gt,
 r0_int, r1_int, r2_int, r3_int, r4_int, r5_int, r6_int, r7_int,
     r0_outt, r1_outt, r2_outt, r3_outt, r4_outt, r5_outt, r6_outt, r7_outt, g_outt, dinoutt,
     a_int, g_int, add_subt, donet, add_sub_outt, buswiret, irt);

endmodule

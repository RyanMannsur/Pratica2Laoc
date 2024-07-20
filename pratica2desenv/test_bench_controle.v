module test_bench_controle;



	reg [9:0]ir; //instruções no formato III XXX YYY ou III XXX DDD
	reg run, resetn, clock; //Sinais de entrada
	wire done, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in,
			r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out,
			a_in, g_in, add_sub, dinout, g_out; //sinais de controle 
	
	initial begin
		clock = 1'b0;
		resetn = 1'b0;
		run = 1'b1;
		ir = 9'b001000000; //MVI R0 2
	end
	
	initial begin
		#25 clock = 1'b1;//1
		#25 clock = 1'b0; //0
		
		#25 clock = ~clock; //1  
		ir = 9'b000001000; //MV R1 R0
		
		#25 clock = 1'b0;//0
		ir = 9'b010001001; //ADD R1 R1
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		
		#25 clock = 1'b0; //0
		ir = 9'b011010000; //SUB R2 R0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1
		
		#25 clock = 1'b0; //0
		#25 clock = 1'b1; //1

	end
	
		controle dut(clock,ir,run, resetn, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, add_sub, dinout, g_out,
					r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, a_in, g_in, done);

endmodule

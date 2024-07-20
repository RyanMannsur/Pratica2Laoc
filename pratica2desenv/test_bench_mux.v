module test_bench_mux;



	reg r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, din_out, g_out; 
	reg [15:0] r0,r1,r2,r3,r4,r5,r6,r7, din, g;
	wire [15:0] buswires;
	
	initial begin
		din = 16'b0000000000000010; // 2
		r0 = 16'b0000000000010010; // 2
		g = 16'b0000000000000011; // 2
		r1 = 16'b0000000011000010; // 2
		r2 = 16'b0000000111000010; // 2
		din = 16'b0000001110000010; // 2
	end
	
	initial begin
		#25 din_out = 1'b1;
		#25 r0_out = 1'b1; din_out = 1'b0; 
		
		#25 r1_out = 1'b1; r0_out = 1'b0;
		
		#25 r2_out = 1'b1; r1_out = 1'b0;
		
		#25 g_out = 1'b1; r2_out = 1'b0;
		
		#25 r1_out = 1'b1; g_out = 1'b0;

	end
	
		mux dut(r0,r1,r2,r3,r4,r5,r6,r7, din, g, r0_out, r1_out, r2_out,
						r3_out, r4_out, r5_out, r6_out, r7_out, din_out, g_out, buswires);

endmodule

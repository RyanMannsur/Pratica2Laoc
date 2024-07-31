module test_bench;



	reg clock, run, resetn;
	reg [15:0] din;
	wire [15:0] saida, r0t, r1t, r2t, r3t, r7t, sp;
	wire [9:0]irt;

	
	initial begin
		resetn = 1'b0;
		run = 1'b1;
		din = 16'b0000000000000010; // 2
	end
	
	initial begin
		#25 clock = 1'b1;//1
		#25 clock = 1'b0; // 0
		din = 16'b0000000000000011;
		
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
	
		pratica2 dut(clock, din, run, resetn, saida,r0t, r1t, r2t, r3t, r7t, irt, sp);

endmodule

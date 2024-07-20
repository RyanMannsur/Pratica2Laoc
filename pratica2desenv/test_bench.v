module test_bench;



	reg clock, run, resetn;
	reg [8:0]ir;
	reg [15:0] din;
	wire [15:0] q;
	
	initial begin
		clock = 1'b0;
		resetn = 1'b0;
		run = 1'b1;
		ir = 9'b001000000; //MVI R0 2
		din = 16'b0000000000000010; // 2
	end
	
	initial begin
		#25 clock = 1'b1;//1
		#25 clock = 1'b0; //0
		
		#25 clock = ~clock;  ir = 9'b000001000; //MV R1 R0
		
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
	
		pratica2 dut(clock, ir, din, run, resetn, q);

endmodule

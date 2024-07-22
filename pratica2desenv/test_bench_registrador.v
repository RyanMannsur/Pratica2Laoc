module test_bench_registrador;



	reg clock, wren;
	reg [15:0] buswire;
	reg [15:0] valor_anterior;
	wire [15:0] data_out;
	
	initial begin
		clock = 1'b0;
		wren = 1'b1;
		buswire = 16'b0000000000000010; // 2
	end
	
	initial begin
		#25 clock = 1'b1;//1
		#25 clock = 1'b0; //0
		
		#25 clock = ~clock;  buswire = 16'b0000000000000111; //MV R1 R0
		
		#25 clock = 1'b0;//0
		#25 clock = ~clock; //1
		#25 clock = ~clock; //0

	end
	
		registrador dut(clock, valor_anterior, buswire, wren, data_out);

endmodule

module extensor(in, out);
//fazer um extensor e bits para quando recebe um imediato, nesse contexto
// o meu imediato so recebe de 0 a 7!!!

	input [2:0] in;
	output reg [15:0] out;
	
	always @(*) begin
        out = {13'b0, in}; // Extensão de zero
    end
	
endmodule

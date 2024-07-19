module registrador(clock, buswire, wren, data_out);

//A ideia aqui é mapear qnd vai ter escrita em um registrador
//Considerando que A e G funcionam tbm como se fosse registradores

	input clock, wren;
	input [15:0] buswire;
	output reg[15:0] data_out;
	
	always @(posedge clock) begin
        if (wren) begin
            data_out <= buswire;
        end
    end
	
endmodule

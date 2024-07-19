module addSub(add_sub, rx, ry, data_out);
//modulo de soma e subtração, qnd o add_sub for 1 faz subtração

	input add_sub;
	input [15:0] rx, ry;
	output reg[15:0] data_out;
	
	always @(*) begin
        if (add_sub) begin
            data_out = rx - ry; // Subtração
        end else begin
            data_out = rx + ry; // Adição
        end
    end
	
endmodule

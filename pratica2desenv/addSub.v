module addSub(add_sub, soma, zero, maior_menor, comparacao, rx, ry, g, data_out);
//modulo de soma e subtração, qnd o add_sub for 1 faz subtração

	input add_sub, soma, zero, maior_menor, comparacao;
	input [15:0] rx, ry, g;
	output reg[15:0] data_out;
	
	always @(*) begin
		case(1'b1)
			soma: begin 
				if (add_sub) begin
					data_out = rx - ry; // Subtração
				end else begin
					data_out = rx + ry; // Adição
				end
			end
			zero: begin
				if(g != 16'b0) begin
					data_out = ry; //MVNZ
				end else begin
					data_out = rx;
				end
			end
			comparacao: begin
				if(rx == ry) begin
					data_out = 16'b1;
				end else begin
					data_out = 16'b0;
				end
			end
			maior_menor: begin
				if(rx<ry) begin
					data_out = 16'b1;
				end else begin
					data_out = 16'b0;
				end
			end
		endcase
    end
	
endmodule

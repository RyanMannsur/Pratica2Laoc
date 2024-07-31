module registrador(
    input clock,
    input wren,
    input [15:0] buswire,
    input [15:0] valor_anterior,
    output reg [15:0] data_out
);

	initial begin
		data_out = 16'b0;
	end

    // Bloco sempre para atualizar o registrador
    always @(negedge clock) begin
        if (wren) begin
            data_out <= buswire; // Atribuição não bloqueante
        end else begin
            data_out <= valor_anterior; // Atribuição não bloqueante
        end
    end

endmodule

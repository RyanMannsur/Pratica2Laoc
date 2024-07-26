module upcount(
    input Clear,
    input Clock,
	 input [15:0] Q_anterior,
	 input [15:0] valor,
	 input wren,
	 input Enable,
    output reg [15:0] Q
);

	initial begin
	 Q <= 16'b0000000000000000;
	end
    always @(negedge Clock or posedge Clear) begin
        if (Clear)
            Q <= 16'b0000000000000000; // Reseta o contador
		else if (wren)
				Q <= valor;
        else if (Enable)
            Q <= Q_anterior + 1'b1; // Incrementa o contador apenas quando Enable for 1
    end
	 
endmodule


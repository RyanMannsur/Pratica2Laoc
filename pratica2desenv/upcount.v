module upcount(
    input Clear,
    input Clock,
	 input Enable,
    output reg [3:0] Q
);
    always @(posedge Clock or posedge Clear) begin
        if (Clear)
            Q <= 4'b0000; // Reseta o contador
        else if (Enable)
            Q <= Q + 1'b1; // Incrementa o contador apenas quando Enable for 1
    end
	 
endmodule


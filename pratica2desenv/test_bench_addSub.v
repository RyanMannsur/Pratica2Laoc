module test_bench_addSub;

    reg add_sub;
    reg [15:0] rx, ry;
    wire [15:0] data_out;

    addSub dut (
        .add_sub(add_sub),
        .rx(rx),
        .ry(ry),
        .data_out(data_out)
    );

    initial begin
        // Teste de adição
        add_sub = 0;
        rx = 16'h0005;
        ry = 16'h0003;
        #10;
        $display("Adição: %h + %h = %h", rx, ry, data_out);

        // Teste de subtração
        add_sub = 1;
        rx = 16'h0005;
        ry = 16'h0003;
        #10;
        $display("Subtração: %h - %h = %h", rx, ry, data_out);
    end

endmodule

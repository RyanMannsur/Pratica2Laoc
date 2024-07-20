module pratica2(clock, ir, din, run, resetn, q);

    input clock;
    input run;
    input resetn;
    input [15:0] din;
    input [8:0] ir; // Instrução no formato III XXX YYY
    output [15:0] q;

    // Sinais internos
    wire [3:0] instrucao_atual;
    wire [15:0] buswire_mux;
    wire [15:0] buswire;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, G;
    wire r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in;
    wire r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, g_out, dinout;
    wire a_in, g_in, add_sub, done;
    wire select_addsub; // Sinal de controle para selecionar entre MUX e addSub
    wire [15:0] addsub_out; // Sinal intermediário para a saída do addSub

    reg [1:0] clock_counter; // Contador de clock

    // Instanciando o contador de instruções
    upcount contador (
        .Clear(resetn),
        .Clock(clock),
        .Enable(done),
        .Q(instrucao_atual)
    );

    // Instanciando os registradores
    registrador reg0 (.clock(clock), .buswire(buswire), .wren(r0_in), .data_out(r0));
    registrador reg1 (.clock(clock), .buswire(buswire), .wren(r1_in), .data_out(r1));
    registrador reg2 (.clock(clock), .buswire(buswire), .wren(r2_in), .data_out(r2));
    registrador reg3 (.clock(clock), .buswire(buswire), .wren(r3_in), .data_out(r3));
    registrador reg4 (.clock(clock), .buswire(buswire), .wren(r4_in), .data_out(r4));
    registrador reg5 (.clock(clock), .buswire(buswire), .wren(r5_in), .data_out(r5));
    registrador reg6 (.clock(clock), .buswire(buswire), .wren(r6_in), .data_out(r6));
    registrador reg7 (.clock(clock), .buswire(buswire), .wren(r7_in), .data_out(r7));

    // Instanciando os módulos A e G
    registrador regA (.clock(clock), .buswire(buswire), .wren(a_in), .data_out(A));
    registrador regG (.clock(clock), .buswire(buswire), .wren(g_in), .data_out(G));

    // Instanciando o MUX
    mux mux_inst (
        .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7),
        .r0_out(r0_out), .r1_out(r1_out), .r2_out(r2_out), .r3_out(r3_out),
        .r4_out(r4_out), .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out), .g_out(g_out),
        .buswires(buswire_mux)
    );

    // Instanciando o módulo de soma/subtração
    addSub add_sub_inst (
        .add_sub(add_sub),
        .rx(A),
        .ry(buswire),
        .data_out(addsub_out) // Usando o sinal intermediário
    );

    // Instanciando o módulo de controle
    controle ctrl (
        .clock(clock),
        .ir(ir), // Usando a instrução de entrada
        .run(run),
        .resetn(resetn),
        .r0_in(r0_in), .r1_in(r1_in), .r2_in(r2_in), .r3_in(r3_in),
        .r4_in(r4_in), .r5_in(r5_in), .r6_in(r6_in), .r7_in(r7_in),
        .r0_out(r0_out), .r1_out(r1_out), .r2_out(r2_out), .r3_out(r3_out),
        .r4_out(r4_out), .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out),
        .a_in(a_in), .g_in(g_in), .g_out(g_out), .dinout(dinout), // Adicionando sinais de controle
        .add_sub(add_sub), .done(done) // Adicionando controle de seleção
    );

    // Lógica do contador de clock
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            clock_counter <= 2'b00;
        else if (done)
            clock_counter <= 2'b00;
        else
            clock_counter <= clock_counter + 1;
    end

    // Instanciando o MUX 2:1 para selecionar o valor do buswire
    mux2to1 buswire_mux_inst (
        .in0(buswire_mux),
        .in1(addsub_out),
        .sel(clock_counter >= 2),
        .out(buswire)
    );

    // Saída do processador
    assign q = buswire;

endmodule

module pratica2(clock, ir, din, run, resetn, q,r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t, At, Gt,
 r0_int, r1_int, r2_int, r3_int, r4_int, r5_int, r6_int, r7_int,
     r0_outt, r1_outt, r2_outt, r3_outt, r4_outt, r5_outt, r6_outt, r7_outt, g_outt, dinoutt,
     a_int, g_int, add_subt, donet, addsub_outt, buswiret);

    input clock;
    input run;
    input resetn;
    input [15:0] din;
    input [8:0] ir; // Instrução no formato III XXX YYY
    output [15:0] q;

    // Sinais internos
    wire [15:0] buswire;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, G;
    wire r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in;
    wire r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, g_out, dinout;
    wire a_in, g_in, add_sub, done;
    wire [15:0] addsub_out; // Sinal intermediário para a saída do addSub
	 
	 output [15:0]r0t, r1t, r2t, r3t, r4t, r5t, r6t, r7t, At, Gt, addsub_outt, buswiret;
	 
	 output r0_int, r1_int, r2_int, r3_int, r4_int, r5_int, r6_int, r7_int;
    output r0_outt, r1_outt, r2_outt, r3_outt, r4_outt, r5_outt, r6_outt, r7_outt, g_outt, dinoutt;
    output a_int, g_int, add_subt, donet;

    // Instanciando os registradores
    registrador reg0 (.clock(clock), .valor_anterior(r0), .buswire(buswire), .wren(r0_in), .data_out(r0));
	 registrador reg1 (.clock(clock), .valor_anterior(r1), .buswire(buswire), .wren(r1_in), .data_out(r1));
	 registrador reg2 (.clock(clock), .valor_anterior(r2), .buswire(buswire), .wren(r2_in), .data_out(r2));
	 registrador reg3 (.clock(clock), .valor_anterior(r3), .buswire(buswire), .wren(r3_in), .data_out(r3));
	 registrador reg4 (.clock(clock), .valor_anterior(r4), .buswire(buswire), .wren(r4_in), .data_out(r4));
	 registrador reg5 (.clock(clock), .valor_anterior(r5), .buswire(buswire), .wren(r5_in), .data_out(r5));
	 registrador reg6 (.clock(clock), .valor_anterior(r6), .buswire(buswire), .wren(r6_in), .data_out(r6));
	 registrador reg7 (.clock(clock), .valor_anterior(r7), .buswire(buswire), .wren(r7_in), .data_out(r7));
	 
	 registrador regA (.clock(clock), .valor_anterior(A), .buswire(buswire), .wren(a_in), .data_out(A));
	 registrador regG (.clock(clock), .valor_anterior(G), .buswire(addsub_out), .wren(g_in), .data_out(G));

    // Instanciando o MUX
    mux mux_inst (
        .din(din), .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7),
		  .r0_out(r0_out), .r1_out(r1_out), .r2_out(r2_out), .r3_out(r3_out), .r4_out(r4_out),
		  .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out), .G(G), .g_out(g_out), .dinout(dinout),
        .buswires(buswire)
    );
	 
	 addSub addSub(.add_sub(add_sub), .rx(A), .ry(buswire), .data_out(addsub_out));

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

    // Saída do processador
    assign q = buswire;
	 assign r0t = r0;
	 assign r1t = r1;
	 assign r2t = r2;
	 assign r3t = r3;
	 assign r4t = r4;
	 assign r5t = r5;
	 assign r6t = r6;
	 assign r7t = r7;
	 assign Gt = G;
	 assign At = A;
	 assign addsub_outt = addsub_out;
	 assign buswiret = buswire;
	 
	 
	 assign r0_int = r0_in;
    assign r1_int = r1_in;
    assign r2_int = r2_in;
    assign r3_int = r3_in;
    assign r4_int = r4_in;
    assign r5_int = r5_in;
    assign r6_int = r6_in;
    assign r7_int = r7_in;

    assign r0_outt = r0_out;
    assign r1_outt = r1_out;
    assign r2_outt = r2_out;
    assign r3_outt = r3_out;
    assign r4_outt = r4_out;
    assign r5_outt = r5_out;
    assign r6_outt = r6_out;
    assign r7_outt = r7_out;

    assign g_outt = g_out;
    assign dinoutt = dinout;
    assign a_int = a_in;
    assign g_int = g_in;
    assign add_subt = add_sub;
    assign donet = done;

endmodule

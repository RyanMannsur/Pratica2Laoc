module pratica2(clock, din, run, resetn, saida,r0t, r1t, r2t, r3t, r7t, irt, sp);
	  
    input clock;
    input run;
    input resetn;
    input [15:0] din;
    reg [9:0] ir; // Instrução no formato IIII XXX YYY
	 output reg[15:0]sp;
    output [15:0] saida;

    // Sinais internos
    wire [15:0] buswire;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, A, G, addr, dout, q_mem;
    wire r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in;
    wire r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, g_out, dout_out, dinout;
    wire a_in, g_in, add_sub, soma, zero, maior_menor, comparacao, done;
    wire [15:0] addsub_out, mvnz_out; // Sinal intermediário para a saída do addSub
	 
	 output [15:0]r0t, r1t, r2t, r3t, r7t;
	 output [9:0]irt;
	 
	 reg [9:0] memoria_intrucao [15:0]; //Tamanho 16, com 9 bits cada.
	 integer index;
	 initial begin
		$readmemb("C:/Verilog/pratica2desenv/mem_file_code.mem", memoria_intrucao); //inicializo a Memoria de instruções
		index = 0;
		sp <= 16'b101;
		ir = memoria_intrucao[index][9:0];
   end
	
	always@(r7) begin
		index = r7[7:0];
		ir = memoria_intrucao[index][9:0];
	end

    // Instanciando os registradores
    registrador reg0 (.clock(clock), .valor_anterior(r0), .buswire(buswire), .wren(r0_in), .data_out(r0));
	 registrador reg1 (.clock(clock), .valor_anterior(r1), .buswire(buswire), .wren(r1_in), .data_out(r1));
	 registrador reg2 (.clock(clock), .valor_anterior(r2), .buswire(buswire), .wren(r2_in), .data_out(r2));
	 registrador reg3 (.clock(clock), .valor_anterior(r3), .buswire(buswire), .wren(r3_in), .data_out(r3));
	 registrador reg4 (.clock(clock), .valor_anterior(r4), .buswire(buswire), .wren(r4_in), .data_out(r4));
	 registrador reg5 (.clock(clock), .valor_anterior(r5), .buswire(buswire), .wren(r5_in), .data_out(r5));
	 registrador reg6 (.clock(clock), .valor_anterior(r6), .buswire(buswire), .wren(r6_in), .data_out(r6));
	 
	 upcount reg7(
    .Clear(resetn),
    .Clock(clock),
	 .Q_anterior(r7),
	 .valor(buswire),
	 .wren(r7_in),
	 .Enable(done),
    .Q(r7)
);
	 //addr é o endereço que irei mapear para escrever lá na memoria
	 registrador regADDR (.clock(clock), .valor_anterior(addr), .buswire(buswire), .wren(addr_in), .data_out(addr));
	// dout é o valor que irei gravar no endereço addr
	registrador regDOUT (.clock(clock), .valor_anterior(dout), .buswire(buswire), .wren(dout_in), .data_out(dout));
	 
	 registrador regA (.clock(clock), .valor_anterior(A), .buswire(buswire), .wren(a_in), .data_out(A));
	 registrador regG (.clock(clock), .valor_anterior(G), .buswire(addsub_out), .wren(g_in), .data_out(G));

	 
	 memoria mem_principal(.clock(clock), .address(addr[6:0]), .wren(wren), .data(dout), .q(q_mem));
	 
    // Instanciando o MUX
    mux mux_inst (
        .din(din), .r0(r0), .r1(r1), .r2(r2), .r3(r3), .r4(r4), .r5(r5), .r6(r6), .r7(r7), .dout(q_mem),
		  .r0_out(r0_out), .r1_out(r1_out), .r2_out(r2_out), .r3_out(r3_out), .r4_out(r4_out),
		  .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out), .G(G), .g_out(g_out), .dout_out(dout_out), .dinout(dinout),
        .buswires(buswire)
    );
	 
	 addSub addSub(.add_sub(add_sub), .soma(soma), .maior_menor(maior_menor), 
						.comparacao(comparacao), .rx(A), .ry(buswire), .data_out(addsub_out));


    // Instanciando o módulo de controle
    controle ctrl (
        .clock(clock),
        .ir(ir), // Usando a instrução de entrada
        .run(run),
        .resetn(resetn),
		  .G(G),
        .r0_in(r0_in), .r1_in(r1_in), .r2_in(r2_in), .r3_in(r3_in),
        .r4_in(r4_in), .r5_in(r5_in), .r6_in(r6_in), .r7_in(r7_in),
        .r0_out(r0_out), .r1_out(r1_out), .r2_out(r2_out), .r3_out(r3_out),
        .r4_out(r4_out), .r5_out(r5_out), .r6_out(r6_out), .r7_out(r7_out),
        .a_in(a_in), .g_in(g_in), .g_out(g_out), .dinout(dinout), // Adicionando sinais de controle
        .add_sub(add_sub), .addr_in(addr_in), .dout_in(dout_in), .dout_out(dout_out), .wren(wren),
		  .soma(soma), .zero(zero), .maior_menor(maior_menor), 
		  .comparacao(comparacao), .done(done) // Adicionando controle de seleção
    );

    // Saída do processador
    assign saida = buswire;
	 assign r0t = r0;
	 assign r1t = r1;
	 assign r2t = r2;
	 assign r3t = r3;
	 assign r7t = r7;
	 assign irt = ir;

endmodule

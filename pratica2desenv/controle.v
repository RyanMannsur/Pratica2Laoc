module controle(clock,ir,run, resetn, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, add_sub, dinout, g_out,
					r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, a_in, g_in,
				   soma, zero, maior_menor, comparacao, addr_in, dout_in, wren, memoria, done);
//Bloco controle, feito para receber a instrução e mapear os sinais que serão usados nos outros
//modulos
					
	input [9:0]ir; //instruções no formato IIII XXX YYY ou III XXX DDD
	input run, resetn, clock; //Sinais de entrada
	output reg done, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in,
			r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out,
			a_in, g_in, add_sub, soma, zero, maior_menor, comparacao, addr_in, 
			dout_in, wren, memoria, dinout, g_out; //sinais de controle 
	
	reg [2:0] Tstate; //estado
	reg [3:0] Instrucion; //instruções
	
	initial begin
		Tstate = 3'b000;
		Instrucion = ir[9:6];
	end
	parameter MV = 4'b0000, MVI = 4'b0001, ADD = 4'b0010, SUB = 4'b0011, LD = 4'b0100, ST = 4'b0101, 
				 MVNZ = 4'b0110, SLT = 4'b0111, CMP = 4'b1000, PUSH = 4'b1001, POP = 4'b1010;
	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011, T4 = 3'b100, T5 = 3'b101;		
	
	always@(posedge clock) begin
		if(done) begin //volta pra T0
			done <= 1'b0;
			Tstate = T0;
		end
		if(resetn) begin
			done <= 1'b1;
			Tstate = T0;
		end
		else begin //zerando sinais
			g_out <= 1'b0;
			dinout <= 1'b0;
			add_sub <= 1'b0;
			r0_out <= 1'b0;
			r1_out <= 1'b0;
			r2_out <= 1'b0;
			r3_out <= 1'b0;
			r4_out <= 1'b0;
			r5_out <= 1'b0;
			r6_out <= 1'b0;
			r7_out <= 1'b0;
			r0_in <= 1'b0;
			r1_in <= 1'b0;
			r2_in <= 1'b0;
			r3_in <= 1'b0;
			r4_in <= 1'b0;
			r5_in <= 1'b0;
			r6_in <= 1'b0;
			r7_in <= 1'b0;
			a_in <= 1'b0;
			g_in <= 1'b0;
			soma <= 1'b0;
			zero <= 1'b0;
			maior_menor <= 1'b0; 
			comparacao <= 1'b0;
			addr_in <= 1'b0;
			dout_in <= 1'b0;
			memoria <= 1'b0;
			wren <= 1'b0;
		case(Tstate)
			T0: if(run) begin
				case (ir[9:6])
					MV: begin//RYout RXin DONE
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					MVI: begin //DINout RXin DONE
						dinout <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					ADD: begin//RXin Ain 
						a_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					SUB: begin //RXin Ain 
						a_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					MVNZ: begin //RXin Ain 
						a_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					CMP: begin //RXin Ain 
						a_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					LD: begin //RXin Addrin 
						addr_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					ST: begin //RXin Addrin 
						addr_in <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
				endcase
				Tstate = T1;
			end
	
			T1: if(run) begin
				case (ir[9:6])
					ADD: begin//RYout Gin
						g_in <= 1'b1;
						soma <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					SUB: begin //RYout Gin AddSub
						g_in <= 1'b1;
						soma <= 1'b1;
						add_sub <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					MVNZ: begin //RYout Gin zero
						g_in <= 1'b1;
						zero <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					SLT: begin //RYout Gin maior_menor
						g_in <= 1'b1;
						maior_menor <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					CMP: begin //RYout Gin comparacao
						g_in <= 1'b1;
						comparacao <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					LD: begin //RYout Doutin
						dout_in <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
					ST: begin //RYout Doutin
						dout_in <= 1'b1;
						case (ir[2:0]) // ir = III XXX YYY
							3'b000: r0_out <= 1'b1;
							3'b001: r1_out <= 1'b1;
							3'b010: r2_out <= 1'b1;
							3'b011: r3_out <= 1'b1;
							3'b100: r4_out <= 1'b1;
							3'b101: r5_out <= 1'b1;
							3'b110: r6_out <= 1'b1;
						endcase
					end
				endcase
				Tstate = T2;
			end
			T2: if(run) begin
				case (ir[9:6])
					ADD: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					SUB: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					MVNZ: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					SLT: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					CMP: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
					LD: begin //memoria
						memoria <= 1'b1;
					end
					ST: begin //memoria wren
						memoria <= 1'b1;
						wren <= 1'b1;
					end
				endcase
				Tstate = T3;
			end
			T3: if(run) begin
				case (ir[9:6])
					LD: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
				ST: begin //Gout RXin DONE
						g_out <= 1'b1;
						case (ir[5:3]) // ir = III XXX YYY
							3'b000: r0_in <= 1'b1;
							3'b001: r1_in <= 1'b1;
							3'b010: r2_in <= 1'b1;
							3'b011: r3_in <= 1'b1;
							3'b100: r4_in <= 1'b1;
							3'b101: r5_in <= 1'b1;
							3'b110: r6_in <= 1'b1;
						endcase
						done <= 1'b1;
					end
				endcase
				Tstate <= T0;
			end
		endcase
	end
	end
endmodule

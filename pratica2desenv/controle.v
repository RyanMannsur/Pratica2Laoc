module controle(clock,ir,run, resetn, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, add_sub, dinout, g_out,
					r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, a_in, g_in, done);
//Bloco controle, feito para receber a instrução e mapear os sinais que serão usados nos outros
//modulos
					
	input [9:0]ir; //instruções no formato III XXX YYY ou III XXX DDD
	input run, resetn, clock; //Sinais de entrada
	output reg done, r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in,
			r7_in, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out,
			a_in, g_in, add_sub, dinout, g_out; //sinais de controle 
	
	reg [2:0] Tstate; //estado
	reg [2:0] Instrucion; //instruções
	
	initial begin
		Tstate = 3'b000;
		Instrucion = ir[8:6];
	end
	parameter MV = 3'b000, MVI = 3'b001, ADD = 3'b010, SUB = 3'b011, LD = 3'b100, ST = 3'b101, MVNZ = 3'b110;
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
		case(Tstate)
			T0: if(run) begin
				case (ir[8:6])
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
				endcase
				Tstate = T1;
			end
	
			T1: if(run) begin
				case (ir[8:6])
					ADD: begin//RYout Gin
						g_in <= 1'b1;
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
				endcase
				Tstate = T2;
			end
			T2: if(run) begin
				case (ir[8:6])
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
				endcase
				Tstate = T0;
			end
		endcase
	end
	end
endmodule

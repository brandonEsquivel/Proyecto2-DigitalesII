/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo probador del arqui
 *@author Giancarlo Marin H.
 *@date   02/07/2019
 *@brief  Modulo que genera las señales y monitoriza las salidas del modulo arqui conductual y estructural sintetizado
*/

// `include "checker_arqui.v"
    module probadorEV(
	input 							fifo_pause_main,				// fifo_pause_main del FIFO main
    input 							fifo_empty_d0,		// empty D0
    input 							fifo_empty_d1,		// empty D1
    input [4:0]					error_out_cond,			
    input 							active_out_cond,			
    input 							idle_out_cond,			
    input  [5:0]       			data_out_0_cond,
    input  [5:0]		       		data_out_1_cond,
	// input pause_main_estruct,

    output reg           clk,
    output reg           reset_L,
    output reg [5:0]  	data_in,            //datos para hacerle push 
    output reg 			push_main,
    output reg 			pop_d0,
    output reg 			pop_d1,
    output reg 			init,
    output reg [1:0]		afMF_i,				// almost full Main FIFO
    output reg [1:0]		aeMF_i,				// almost empty Main FIFO
    output reg [3:0]		afVC_i,				// almost full VC FIFO
    output reg [3:0]		aeVC_i,				// almost empty VC FIFO
    output reg [1:0]		afDF_i,				// almost full D FIFO
    output reg [1:0]		aeDF_i				// almost empty D FIFO
    );

/*AUTOWIRE*/
wire			arqui_checks_out;	// From ch0 of checker_arqui.v

/*AUTOREGINPUT*/
reg [4:0]		salida_arqui_c;		// To ch0 of checker_arqui.v
reg [4:0]		salida_arqui_e;		// To ch0 of checker_arqui.v


	initial begin
		$dumpfile("arqui.vcd");		// archivo "dump"
		$dumpvars;					// dumping de variables
		
		aeMF_i<='b01;
		aeDF_i<='b01;
		aeVC_i<='b0010;
		
		afMF_i<='b11;
		afDF_i<='b11;
		afVC_i<='b1110;

		reset_L<='b0;
		init<='b0;
		data_in<='b101100;
		push_main<='b0;
		pop_d0<='b0;
		pop_d1<='b0;

		@(posedge clk);
      		reset_L<='b1;

		repeat (2) begin
			@(posedge clk);//esperar a tener los valores de umbral
		end

		repeat (4) begin
		@(posedge clk);
				reset_L<='b1;
				if (!fifo_pause_main) begin
					data_in<=data_in+1;
					push_main<='b1;
				end else begin
					push_main<='b0;
				end

				if(!fifo_empty_d0)begin
					pop_d0<='b1;
				end else begin
					pop_d0<='b0;
				end

				if (!fifo_empty_d1) begin
					pop_d1<='b1;
				end else begin
					pop_d1<='b0;
				end				
			
		end

		@(posedge clk);
      		data_in<='b001100;
			push_main<='b0;

		@(posedge clk);
      		data_in<='b000010;
			push_main<='b0;

		repeat (16) begin
		@(posedge clk);
			
				reset_L<='b1;
				if (!fifo_pause_main) begin
					data_in<=data_in+1;
					push_main<='b1;
				end
				else begin
					push_main<='b0;
				end

				if(!fifo_empty_d0)begin
					pop_d0<='b1;
				end else begin
					pop_d0<='b0;
				end

				if (!fifo_empty_d1) begin
					pop_d1<='b1;
				end else begin
					pop_d1<='b0;
				end				
			
		end
		$finish;	
	end
	// Generador del clk
	initial	clk <= 0;				// Valor inicial del clk
	always #2 clk <= ~clk;			// toggle cada 10ns
endmodule

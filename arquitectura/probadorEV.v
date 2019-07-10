/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo probador del arqui
 *@author Giancarlo Marin H.
 *@date   02/07/2019
 *@brief  Modulo que genera las señales y monitoriza las salidas del modulo arqui conductual y estructural sintetizado
*/

`include "checker_arqui.v"
    module probador(
	input 		error_out_cond,			
    input 		active_out_cond,			
    input 		idle_out_cond,			
    input  [5:0]       data_out0_cond,
    input  [5:0]       data_out1_cond,

	input 		error_out_estruct,			
    input 		active_out_estruct,			
    input 		idle_out_estruct,			
    input  [5:0]       data_out0_estruct,
    input  [5:0]       data_out1_estruct,

	input empty_D0_cond,
	input empty_D1_cond,
	input empty_D0_estruct,
	input empty_D1_estruct,
	input pause_main_cond,
	input pause_main_estruct,

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
reg			clk;			// To ch0 of checker_arqui.v
reg			reset_L;		// To ch0 of checker_arqui.v
reg [4:0]		salida_arqui_c;		// To ch0 of checker_arqui.v
reg [4:0]		salida_arqui_e;		// To ch0 of checker_arqui.v

    checker_arqui ch0(/*autoinst*/
		      // Outputs
		      .arqui_checks_out	(arqui_checks_out),
		      // Inputs
		      .clk		(clk),
		      .reset_L		(reset_L),
		      .salida_arqui_c	(salida_arqui_c[4:0]),
		      .salida_arqui_e	(salida_arqui_e[4:0]));

	initial begin
		$dumpfile("arqui.vcd");		// archivo "dump"
		$dumpvars;					// dumping de variables
		
		afMF_i<='b11;
		aeMF_i<='b01;
		aeVC_i<='b0011;
		aeDF_i<='b0011;
		afVC_i<='b1110;
		afDF_i<='b1110;

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

		repeat (18) begin
		@(posedge clk);
			if (error_out_cond) begin
				reset_L<='b1;	
			end else begin
				reset_L<='b1;
				if (!pause_main_cond) begin
					data_in<=data_in+1;
					push_main<='b1;
				end
				else begin
					push_main<='b0;
				end

				if(!empty_D0_cond)begin
					pop_d0<='b1;
				end else begin
					pop_d0<='b0;
				end

				if (!empty_D1_cond) begin
					pop_d1<='b1;
				end else begin
					pop_d1<='b0;
				end				
			end

		end

		@(posedge clk);
      		data_in<='b001100;
		$finish;	
	end
	// Generador del clk
	initial	clk <= 0;				// Valor inicial del clk
	always #10 clk <= ~clk;			// toggle cada 10ns
endmodule

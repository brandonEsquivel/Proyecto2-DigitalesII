/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Tarea #8 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda
 *@date   02/07/2019
 *@brief  Banco de pruebas del demux con su respectivo probador
*/

`timescale 	1ns	/ 100ps		// escala
// includes de archivos de verilog
`include "mux.v"
`include "mux_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench; // Testbench
parameter DATA_SIZE = 4;
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From test0 of probador.v
	wire [DATA_SIZE-1:0] data_out0_c;		// From demux_con of demux.v, ..., Couldn't Merge
	wire [DATA_SIZE-1:0] data_out0_e;		// From demux_con of demux.v, ..., Couldn't Merge
	wire [DATA_SIZE-1:0] data_out1_c;		// From demux_con of demux.v, ..., Couldn't Merge
	wire [DATA_SIZE-1:0] data_out1_e;		// From demux_con of demux.v, ..., Couldn't Merge
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire [DATA_SIZE-1:0] data_VC0;		// From test0 of probador.v
	wire [DATA_SIZE-1:0] data_VC1;		// From test0 of probador.v
	wire		pop_delay_VC0;		// From test0 of probador.v
	// End of automatics
	wire		reset_L;		// From test0 of probador.v
	// End of automatics
	/*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    mux mux_con(/*AUTOINST*/
		// Outputs
		.data_out		(data_out0_c[DATA_SIZE-1:0]),
		// Inputs
		.selector		(selector),
		.clk			(clk),
		.pop_delay_VC0		(pop_delay_VC0),
		.data_VC0		(data_VC0),
		.data_VC1		(data_VC1));

	mux_Synth mux_est(/*AUTOINST*/
			  // Outputs
			  .data_out		(data_out0_e[3:0]),
			  // Inputs
			  .clk			(clk),
			  .data_VC0		(data_VC0),
			  .data_VC1		(data_VC1),
			  .pop_delay_VC0	(pop_delay_VC0),
			  .selector		(selector));
	
    probador test0(/*AUTOINST*/
		   // Outputs
           .selector    (selector),
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .pop_delay_VC0	(pop_delay_VC0),
		   .data_VC0		(data_VC0[DATA_SIZE-1:0]),
		   .data_VC1		(data_VC1[DATA_SIZE-1:0]),
		   // Inputs
		   .data_out0_c		(data_out0_c[DATA_SIZE-1:0]),
		   .data_out0_e		(data_out0_e[DATA_SIZE-1:0]));

endmodule

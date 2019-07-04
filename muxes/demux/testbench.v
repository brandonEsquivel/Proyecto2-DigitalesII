/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Tarea #8 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda
 *@date   02/07/2019
 *@brief  Banco de pruebas del demux con su respectivo probador
*/

`timescale 	1ns	/ 100ps		// escala
// includes de archivos de verilog
`include "demux.v"
`include "demux_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench; // Testbench
parameter DATA_SIZE = 4;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From test0 of probador.v
	wire [DATA_SIZE-1:0] data0_c;		// From demux_con of demux.v, ..., Couldn't Merge
    wire [DATA_SIZE-1:0] data0_e;
	wire [DATA_SIZE-1:0] data1_c;		// From demux_con of demux.v, ..., Couldn't Merge
	wire [DATA_SIZE-1:0] data1_e;		// From demux_con of demux.v, ..., Couldn't Merge
	wire [DATA_SIZE-1:0] data_in;		// From test0 of probador.v
	wire		en_pop;			// From test0 of probador.v
	wire		push0;			// From demux_con of demux.v, ...
	wire		push1;			// From demux_con of demux.v, ...
	wire		reset_L;		// From test0 of probador.v
	wire        selector;
    // End of automatics
	/*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    demux demux_con(/*AUTOINST*/
		    // Outputs
		    .push0		(push0_c),
		    .push1		(push1_c),
		    .data0		(data0_c[DATA_SIZE-1:0]),
		    .data1		(data1_c[DATA_SIZE-1:0]),
		    // Inputs
		    .selector		(selector),
		    .en_pop		(en_pop),
		    .clk		(clk),
		    .data_in		(data_in[DATA_SIZE-1:0]));

	demux_Synth demux_est(/*AUTOINST*/
			      // Outputs
			      .data0		(data0_e[3:0]),
			      .data1		(data1_e[3:0]),
			      .push0		(push0_e),
			      .push1		(push1_e),
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[3:0]),
			      .en_pop		(en_pop),
			      .selector		(selector));
	
    probador test0(/*AUTOINST*/
		   // Outputs
           .selector    (selector),
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .en_pop		(en_pop),
		   .data_in		(data_in[DATA_SIZE-1:0]),
		   // Inputs
		   .push0_c		(push0_c),
		   .push0_e		(push0_e),
		   .push1_c		(push1_c),
		   .push1_e		(push1_e),
		   .data_out0_c		(data0_c[DATA_SIZE-1:0]),
		   .data_out0_e		(data0_e[DATA_SIZE-1:0]),
		   .data_out1_c		(data1_c[DATA_SIZE-1:0]),
		   .data_out1_e		(data1_e[DATA_SIZE-1:0]));

endmodule

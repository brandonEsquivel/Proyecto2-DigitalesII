/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Proyecto #2 - IE-0523 - modulo probador.v
*@author Moises Campos Zepeda, Esteban Valverde, Giancarlo Marin
*@date   02/07/2019
*@brief Modulo principal, que junta los modulos anteriores y agrega logica miscelanea.
*/

`timescale 1ns/1ps

//archivo header
//`include "includes.vh"
// `include "buffer.v"
`include "demux_vc.v"
`include "demux_d.v"
`include "fifo_main.v"
`include "fifo_vc0.v"
`include "fifo_vc1.v"
`include "fifo_d0.v"
`include "fifo_d1.v"
`include "fsm.v"
`include "input_flow.v"
`include "output_flow.v"
`include "mux.v"
`include "RAM_memory.v"


module  arqui #(parameter DATA_SIZE=6)(
    input                               clk,
    input                               reset_L,
    input [5:0]           		 		data_in,            //datos 
    input 								push_main,
    input 								pop_d0,
    input 								pop_d1,
    input 								init,
    input [1:0]							afMF_i,				// almost full Main FIFO
    input [1:0]							aeMF_i,				// almost empty Main FIFO
    input [3:0]							afVC_i,				// almost full VC FIFO
    input [3:0]							aeVC_i,				// almost empty VC FIFO
    input [1:0]							afDF_i,				// almost full D FIFO
    input [1:0]							aeDF_i,
					// almost empty D FIFO
    output 							fifo_pause_main,				// pause del FIFO main
    output 							fifo_empty_d0,		// empty D0
    output 							fifo_empty_d1,		// empty D1
	// estado del fifo
    output  [4:0]					error_out_cond,			
    output  							active_out_cond,			
    output  							idle_out_cond,	
	//salidas 
    output   [5:0]       			data_out_0_cond,
    output   [5:0]		       		data_out_1_cond
);
	
	/*AUTOREGS*/
	reg [4:0] FIFO_errors;
	reg [4:0] FIFO_empties;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire [1:0]	aeD_o;			// From fsm0 of fsm.v
	wire [1:0]	aeMF_o;			// From fsm0 of fsm.v
	wire [3:0]	aeVC_o;			// From fsm0 of fsm.v
	wire [1:0]	afD_o;			// From fsm0 of fsm.v
	wire [1:0]	afMF_o;			// From fsm0 of fsm.v
	wire [3:0]	afVC_o;			// From fsm0 of fsm.v
	wire [DATA_SIZE-1:0] data_d0;		// From demux_d of demux_d.v
	wire [DATA_SIZE-1:0] data_d1;		// From demux_d of demux_d.v
	wire [DATA_SIZE-1:0] data_demux_d;	// From mux0 of mux.v
	wire [DATA_SIZE-1:0] data_demux_vc;	// From main of fifo_main.v
	wire [DATA_SIZE-1:0] data_mux_0;	// From vc0 of fifo_vc0.v
	wire [DATA_SIZE-1:0] data_mux_1;	// From vc1 of fifo_vc1.v
	wire [DATA_SIZE-1:0] data_vc0;		// From demux_main of demux_vc.v
	wire [DATA_SIZE-1:0] data_vc1;		// From demux_main of demux_vc.v
	wire		fifo_empty_main;	// From main of fifo_main.v
	wire		fifo_empty_vc0;		// From vc0 of fifo_vc0.v
	wire		fifo_empty_vc1;		// From vc1 of fifo_vc1.v
	wire		fifo_error_d0;		// From d0 of fifo_d0.v
	wire		fifo_error_d1;		// From d1 of fifo_d1.v
	wire		fifo_error_main;	// From main of fifo_main.v
	wire		fifo_error_vc0;		// From vc0 of fifo_vc0.v
	wire		fifo_error_vc1;		// From vc1 of fifo_vc1.v
	wire		fifo_pause_d0;		// From d0 of fifo_d0.v
	wire		fifo_pause_d1;		// From d1 of fifo_d1.v
	wire		fifo_pause_vc0;		// From vc0 of fifo_vc0.v
	wire		fifo_pause_vc1;		// From vc1 of fifo_vc1.v
	wire		pop_b;			// From in_flow of input_flow.v
	wire		pop_b0;			// From of of output_flow.v
	wire		pop_b1;			// From of of output_flow.v
	wire		pop_main;		// From in_flow of input_flow.v
	wire		pop_vc0;		// From of of output_flow.v
	wire		pop_vc1;		// From of of output_flow.v
	wire		push_d0;		// From demux_d of demux_d.v
	wire		push_d1;		// From demux_d of demux_d.v
	wire		push_vc0;		// From demux_main of demux_vc.v
	wire		push_vc1;		// From demux_main of demux_vc.v
	wire		valid_out_main;		// From in_flow of input_flow.v
	// End of automatics
    //Instanciacion
    fsm fsm0(/*autoinst*/
	     // Outputs
	     .error_out_cond		(error_out_cond[4:0]),
	     .active_out_cond		(active_out_cond),
	     .idle_out_cond		(idle_out_cond),
	     .afMF_o			(afMF_o[1:0]),
	     .aeMF_o			(aeMF_o[1:0]),
	     .afD_o			(afD_o[1:0]),
	     .aeD_o			(aeD_o[1:0]),
	     .afVC_o			(afVC_o[3:0]),
	     .aeVC_o			(aeVC_o[3:0]),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .init			(init),
	     .FIFO_errors		(FIFO_errors[4:0]),
	     .FIFO_empties		(FIFO_empties[4:0]),
	     .afMF_i			(afMF_i[1:0]),
	     .aeMF_i			(aeMF_i[1:0]),
	     .afVC_i			(afVC_i[3:0]),
	     .aeVC_i			(aeVC_i[3:0]),
	     .afDF_i			(afDF_i[1:0]),
	     .aeDF_i			(aeDF_i[1:0]));

    fifo_main main(/*autoinst*/
		   // Outputs
		   .fifo_empty_main	(fifo_empty_main),
		   .data_demux_vc	(data_demux_vc[DATA_SIZE-1:0]),
		   .fifo_error_main	(fifo_error_main),
		   .fifo_pause_main	(fifo_pause_main),
		   // Inputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .pop_main		(pop_main),
		   .push_main		(push_main),
		   .data_in		(data_in[DATA_SIZE-1:0]),
		   .afMF_o		(afMF_o[1:0]),
		   .aeMF_o		(aeMF_o[1:0]));

    input_flow in_flow (/*autoinst*/
			// Outputs
			.pop_main	(pop_main),
			.pop_b		(pop_b),
			.valid_out_main	(valid_out_main),
			// Inputs
			.reset_L	(reset_L),
			.fifo_pause_vc0	(fifo_pause_vc0),
			.fifo_pause_vc1	(fifo_pause_vc1),
			.fifo_empty_main(fifo_empty_main),
			.fifo_error_main(fifo_error_main));

    demux_vc demux_main(/*autoinst*/
			// Outputs
			.push_vc0	(push_vc0),
			.push_vc1	(push_vc1),
			.data_vc0	(data_vc0[DATA_SIZE-1:0]),
			.data_vc1	(data_vc1[DATA_SIZE-1:0]),
			// Inputs
			.valid_out_main	(valid_out_main),
			.clk		(clk),
			.data_demux_vc	(data_demux_vc[DATA_SIZE-1:0]));

    fifo_vc0 vc0(/*autoinst*/
		 // Outputs
		 .fifo_empty_vc0	(fifo_empty_vc0),
		 .data_mux_0		(data_mux_0[DATA_SIZE-1:0]),
		 .fifo_error_vc0	(fifo_error_vc0),
		 .fifo_pause_vc0	(fifo_pause_vc0),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .pop_vc0		(pop_vc0),
		 .push_vc0		(push_vc0),
		 .data_vc0		(data_vc0[DATA_SIZE-1:0]),
		 .afVC_o		(afVC_o[3:0]),
		 .aeVC_o		(aeVC_o[3:0]));

    fifo_vc1 vc1(/*autoinst*/
		 // Outputs
		 .fifo_empty_vc1	(fifo_empty_vc1),
		 .data_mux_1		(data_mux_1[DATA_SIZE-1:0]),
		 .fifo_error_vc1	(fifo_error_vc1),
		 .fifo_pause_vc1	(fifo_pause_vc1),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .pop_vc1		(pop_vc1),
		 .push_vc1		(push_vc1),
		 .data_vc1		(data_vc1[DATA_SIZE-1:0]),
		 .afVC_o		(afVC_o[3:0]),
		 .aeVC_o		(aeVC_o[3:0]));

    output_flow of(/*autoinst*/
		   // Outputs
		   .pop_vc0		(pop_vc0),
		   .pop_vc1		(pop_vc1),
		   .pop_b0		(pop_b0),
		   .pop_b1		(pop_b1),
		   // Inputs
		   .fifo_empty_vc0	(fifo_empty_vc0),
		   .fifo_empty_vc1	(fifo_empty_vc1),
		   .fifo_pause_d0	(fifo_pause_d0),
		   .fifo_pause_d1	(fifo_pause_d1));

    mux mux0(/*autoinst*/
	     // Outputs
	     .data_demux_d		(data_demux_d[DATA_SIZE-1:0]),
	     // Inputs
	     .clk			(clk),
	     .pop_delay_vc0		(pop_delay_vc0),
	     .pop_delay_vc1		(pop_delay_vc1),
	     .data_mux_0		(data_mux_0[DATA_SIZE-1:0]),
	     .data_mux_1		(data_mux_1[DATA_SIZE-1:0]));

    demux_d demux_d(/*autoinst*/
		    // Outputs
		    .push_d0		(push_d0),
		    .push_d1		(push_d1),
		    .data_d0		(data_d0[DATA_SIZE-1:0]),
		    .data_d1		(data_d1[DATA_SIZE-1:0]),
		    // Inputs
		    .clk		(clk),
		    .data_demux_d	(data_demux_d[DATA_SIZE-1:0]));

    fifo_d0 d0(/*autoinst*/
	       // Outputs
	       .fifo_empty_d0		(fifo_empty_d0),
	       .data_out_0_cond		(data_out_0_cond[DATA_SIZE-1:0]),
	       .fifo_error_d0		(fifo_error_d0),
	       .fifo_pause_d0		(fifo_pause_d0),
	       // Inputs
	       .clk			(clk),
	       .reset_L			(reset_L),
	       .pop_d0			(pop_d0),
	       .push_d0			(push_d0),
	       .data_d0			(data_d0[DATA_SIZE-1:0]),
	       .afD_o			(afD_o[1:0]),
	       .aeD_o			(aeD_o[1:0]));

    fifo_d1 d1(/*autoinst*/
	       // Outputs
	       .fifo_empty_d1		(fifo_empty_d1),
	       .data_out_1_cond		(data_out_1_cond[DATA_SIZE-1:0]),
	       .fifo_error_d1		(fifo_error_d1),
	       .fifo_pause_d1		(fifo_pause_d1),
	       // Inputs
	       .clk			(clk),
	       .reset_L			(reset_L),
	       .pop_d1			(pop_d1),
	       .push_d1			(push_d1),
	       .data_d1			(data_d1[DATA_SIZE-1:0]),
	       .afD_o			(afD_o[1:0]),
	       .aeD_o			(aeD_o[1:0]));

    // asignacion de buses intermedios
    
	always @(*) begin
    	FIFO_empties=0;
    	FIFO_errors=0;
    	if(~reset_L) begin
    		FIFO_empties = 0;
    	end else begin
    		FIFO_empties[0]=fifo_empty_main;
    		FIFO_empties[1]=fifo_empty_vc0;
    		FIFO_empties[2]=fifo_empty_vc1;
    		FIFO_empties[3]=fifo_empty_d0;
    		FIFO_empties[4]=fifo_empty_d1;
    		FIFO_errors[0]=fifo_error_main;
    		FIFO_errors[1]=fifo_error_vc0;
    		FIFO_errors[2]=fifo_error_vc1;
    		FIFO_errors[3]=fifo_error_d0;
    		FIFO_errors[4]=fifo_error_d1;
    	end
    end
    
    // salidas necesarias para el bloque externo
    // always @(posedge clk) begin
    // 	if(~reset_L) begin
    // 		pause <= 0;
    // 		empty_out_0 <=0;
    // 		empty_out_1 <=0;
    // 	end else begin
    // 		pause <= fifo_pause_main;
    // 		empty_out_0 <= FIFO_empties[3];
    // 		empty_out_1 <= FIFO_empties[4];
    // 	end
    // end

endmodule

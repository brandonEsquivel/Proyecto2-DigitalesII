/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Proyecto #2 - IE-0523 - modulo probador.v
*@author Moises Campos Zepeda, Esteban Valverde, Giancarlo Marin
*@date   02/07/2019
*@brief Modulo sumador, con un identificador que se debera retrasar la misma
*cantidad de ciclos que tarda la suma
*/

`timescale 1ns/1ps

//modulos anteriores
`include "../fifo/fifo.v"
`include "../fsm/fsm.v"
`include "../muxes/mux/mux.v"
`include "../muxes/demux/demux.v"

module arqui#(
    parameter MAIN_QUEUE_SIZE = 4,        //Cantiad de filas del main fifo
    parameter OUTPUT_SIZE = 6,
    parameter DATA_SIZE = 3             //cantidad de bits de entrada
)(
    input                               clk,
    input                               reset_L,
    input       [MAIN_QUEUE_SIZE-1:0]   data_in,            //datos para hacerle push 
    output reg  [OUTPUT_SIZE-1:0]       data_out0,
    output reg  [OUTPUT_SIZE-1:0]       data_out1

);


    fsm fsm0(/*AUTOINST*/
	     // Outputs
	     .error_out_cond		(error_out_cond[4:0]),
	     .active_out_cond		(active_out_cond),
	     .idle_out_cond		(idle_out_cond),
	     // Inputs
	     .clk			(clk),
	     .reset_L			(reset_L),
	     .init			(init),
	     .FIFO_errors		(FIFO_errors[4:0]),
	     .FIFO_empties		(FIFO_empties[4:0]),
	     .afMFs			(afMFs[2:0]),
	     .aeMFs			(aeMFs[2:0]),
	     .afVCs			(afVCs[2:0]),
	     .aeVCs			(aeVCs[2:0]),
	     .afDs			(afDs[2:0]),
	     .aeDs			(aeDs[2:0]));

    fifo Main_FIFO#(
        DATA_SIZE = 4,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/
      // Outputs
      .almost_full_cond			(almost_full_cond),
      .almost_empty_cond		(almost_empty_cond),
      .fifo_full_cond			(fifo_full_cond),
      .fifo_empty_cond			(fifo_empty_cond),
      .data_count_cond			(data_count_cond[MAIN_QUEUE_SIZE-1:0]),
      .buffer_out_cond			(buffer_out_cond[MAIN_QUEUE_SIZE-1:0]),
      .error_cond			(error_cond),
      // Inputs
      .clk				(clk),
      .reset_L				(reset_L),
      .read				(read),
      .write				(write),
      .buff_in				(buff_in[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_full			(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_empty			(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]));


    fifo vc0 #(
        DATA_SIZE = 16,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/
      // Outputs
      .almost_full_cond			(almost_full_cond),
      .almost_empty_cond		(almost_empty_cond),
      .fifo_full_cond			(fifo_full_cond),
      .fifo_empty_cond			(fifo_empty_cond),
      .data_count_cond			(data_count_cond[MAIN_QUEUE_SIZE-1:0]),
      .buffer_out_cond			(buffer_out_cond[MAIN_QUEUE_SIZE-1:0]),
      .error_cond			(error_cond),
      // Inputs
      .clk				(clk),
      .reset_L				(reset_L),
      .read				(read),
      .write				(write),
      .buff_in				(buff_in[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_full			(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_empty			(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]));


    fifo vc1 #(
        DATA_SIZE = 16
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/
      // Outputs
      .almost_full_cond			(almost_full_cond),
      .almost_empty_cond		(almost_empty_cond),
      .fifo_full_cond			(fifo_full_cond),
      .fifo_empty_cond			(fifo_empty_cond),
      .data_count_cond			(data_count_cond[MAIN_QUEUE_SIZE-1:0]),
      .buffer_out_cond			(buffer_out_cond[MAIN_QUEUE_SIZE-1:0]),
      .error_cond			(error_cond),
      // Inputs
      .clk				(clk),
      .reset_L				(reset_L),
      .read				(read),
      .write				(write),
      .buff_in				(buff_in[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_full			(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_empty			(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]));


    fifo d0 #(
        DATA_SIZE = 4,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/
      // Outputs
      .almost_full_cond			(almost_full_cond),
      .almost_empty_cond		(almost_empty_cond),
      .fifo_full_cond			(fifo_full_cond),
      .fifo_empty_cond			(fifo_empty_cond),
      .data_count_cond			(data_count_cond[MAIN_QUEUE_SIZE-1:0]),
      .buffer_out_cond			(buffer_out_cond[MAIN_QUEUE_SIZE-1:0]),
      .error_cond			(error_cond),
      // Inputs
      .clk				(clk),
      .reset_L				(reset_L),
      .read				(read),
      .write				(write),
      .buff_in				(buff_in[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_full			(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
      .umb_almost_empty			(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]));

endmodule

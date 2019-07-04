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
    parameter DATA_SIZE = 6             //cantidad de bits de entrada
)(
    input                               clk,
    input                               reset_L,
    input       [DATA_SIZE-1:0]   		data_in,            //datos para hacerle push 
    input 								push_M,
    input 								pop_d0,
    input 								pop_d1,
    input [1:0]							afMF_i,				// almost full Main FIFO
    input [1:0]							aeMF_i,				// almost empty Main FIFO
    input [3:0]							afVC_i,				// almost full VC FIFO
    input [3:0]							aeVC_i,				// almost empty VC FIFO
    input [1:0]							afDF_i,				// almost full D FIFO
    input [1:0]							aeDF_i,				// almost empty D FIFO
    output reg 							error_out,			
    output reg 							active_out,			
    output reg 							idle_out,			
    output reg  [OUTPUT_SIZE-1:0]       data_out0,
    output reg  [OUTPUT_SIZE-1:0]       data_out1
);

    fsm fsm0(/*AUTOINST*/);

    fifo Main_FIFO#(
        DATA_SIZE = 4,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/);


    fifo vc0 #(
        DATA_SIZE = 16,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/);


    fifo vc1 #(
        DATA_SIZE = 16
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/);


    fifo d0 #(
        DATA_SIZE = 4,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/);


    fifo d1 #(
        DATA_SIZE = 4,
        MAIN_QUEUE_SIZE = 6
    )(/*AUTOINST*/);



endmodule

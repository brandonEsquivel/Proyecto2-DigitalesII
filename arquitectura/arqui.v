/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Proyecto #2 - IE-0523 - modulo probador.v
*@author Moises Campos Zepeda, Esteban Valverde, Giancarlo Marin
*@date   02/07/2019
*@brief Modulo principal, que junta los modulos anteriores y agrega logica miscelanea.
*/

`timescale 1ns/1ps

//archivo header
`include "includes.vh"


module arqui(
)(
    input                               clk,
    input                               reset_L,
    input [DATA_SIZE-1:0]  		 		data_in,            //datos para hacerle push 
    input 								push_main,
    input 								pop_d0,
    input 								pop_d1,
    input 								init
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

    

    



endmodule

`timescale 1ns/1ps



//modulos anteriores
`include "../fifo/fifo.v"
`include "../fsm/fsm.v"


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

endmodule

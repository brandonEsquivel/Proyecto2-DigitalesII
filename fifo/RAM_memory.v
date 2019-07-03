`timescale 1ns / 1ps

module RAM_memory #(
    //Parametros
    parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
    parameter DATA_SIZE = 3             //cantidad de bits de entrada 
)(
    //Entradas
    input                             clk,
    input                             read,         //enable del read
    input                             write,        //enable del write
    input                             reset_L,
    input       [MAIN_QUEUE_SIZE-1:0] data_in,
    input       [DATA_SIZE-1:0]       wr_ptr,
    input       [DATA_SIZE-1:0]       rd_ptr,
    output reg  [MAIN_QUEUE_SIZE-1:0] data_out
);
    //memoria a la cual se le accesa con una direccion
    reg[MAIN_QUEUE_SIZE-1:0] ram_mem[2**DATA_SIZE-1:0];

    //flags
   // reg wr;

   // always@(write)


    always@( posedge clk ) begin
        data_out <= read ?  ram_mem[rd_ptr] : 'b0 ;      
        ram_mem[wr_ptr] <=  write ? data_in : 'b0 ; 
    end
endmodule

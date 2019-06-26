`timescale 1ns / 1ps

module RAM_memory #(
    //Parametros
    parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
    parameter DATA_SIZE = 6             //cantidad de bits de entrada 
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

    always@( posedge clk ) begin
        if ( !reset_L )begin
            data_out <= 'b0;
        end
        else begin
            if( write ) begin                    //Read, and write conditions
                ram_mem[wr_ptr] <= data_in;
            end
            if ( read ) begin
                data_out <= ram_mem[rd_ptr];
            end
        end
    end
endmodule

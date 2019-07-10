`timescale 1ns/1ps

module demux #(
    parameter DATA_SIZE = 4,
    parameter BIT_SELECT = 1  )(       //parametro para elegir entre vc_id(1) y dest(2) 
    input                       en_pop,
    input                       clk,
    input       [DATA_SIZE-1:0] data_demux,
    output reg                  push0,
    output reg                  push1,
    output reg  [DATA_SIZE-1:0] data0,
    output reg  [DATA_SIZE-1:0] data1     
    );

   reg selector;

    always@( * ) begin
        data0   = 'b0;
        data1   = 'b0;
        push0   = 'b0;
        push1   = 'b0;
        selector = data_demux[DATA_SIZE - BIT_SELECT];
        //Logica para arqui.v:
        
        if ( en_pop ) begin
           //seleccion de logicas
            data0 = ~selector ? data_demux : 'b0;
            push0 = ~selector ? 1 : 'b0;
            
            data1 = selector ? data_demux : 'b0;
            push1 = selector ? 1 : 'b0;
        end 
    end

endmodule

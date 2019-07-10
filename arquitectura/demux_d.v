`timescale 1ns/1ps

module demux_d #(
    parameter DATA_SIZE = 6,
    parameter BIT_SELECT = 2  )(       //parametro para elegir entre vc_id(1) y dest(2) 
    //input                       valid_out_main,
    input                       clk,
    input       [DATA_SIZE-1:0] data_demux_d,
    output reg                  push_d0,
    output reg                  push_d1,
    output reg  [DATA_SIZE-1:0] data_d0,
    output reg  [DATA_SIZE-1:0] data_d1     
    );

   reg selector;

    always@( * ) begin
        data_d0   = 'b0;
        data_d1   = 'b0;
        push_d0   = 'b0;
        push_d1   = 'b0;
        selector = data_demux_d[DATA_SIZE - BIT_SELECT];
        //Logica para arqui.v:
        
       // if ( valid_out_main ) begin
           //seleccion de logicas
            data_d0 = ~selector ? data_demux_d : 'b0;
            push_d0 = ~selector ? 1 : 'b0;
            
            data_d1 = selector ? data_demux_d : 'b0;
            push_d1 = selector ? 1 : 'b0;
       // end 
    end

endmodule

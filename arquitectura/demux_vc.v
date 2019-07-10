`timescale 1ns/1ps

module demux_vc #(
    parameter DATA_SIZE = 6,
    parameter BIT_SELECT = 1  )(       //parametro para elegir entre vc_id(1) y dest(2) 
    input                       valid_out_main,
    input                       clk,
    input       [DATA_SIZE-1:0] data_demux_vc,
    output reg                  push_vc0,
    output reg                  push_vc1,
    output reg  [DATA_SIZE-1:0] data_vc0,
    output reg  [DATA_SIZE-1:0] data_vc1     
    );

   reg selector;

    always@( * ) begin
        data_vc0   = 'b0;
        data_vc1   = 'b0;
        push_vc0   = 'b0;
        push_vc1   = 'b0;
        selector = data_demux_vc[DATA_SIZE - BIT_SELECT];
        //Logica para arqui.v:
        
        if ( valid_out_main ) begin
           //seleccion de logicas
            data_vc0 = ~selector ? data_demux_vc : 'b0;
            push_vc0 = ~selector ? 1 : 'b0;
            
            data_vc1 = selector ? data_demux_vc : 'b0;
            push_vc1 = selector ? 1 : 'b0;
        end 
    end

endmodule

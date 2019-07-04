`timescale 1ns/1ps

module demux #(
    parameter DATA_SIZE = 4 )(
    
    input                       selector,
    input                       en_pop,
    input                       clk,
    input       [DATA_SIZE-1:0] data_in,
    output reg                  push0,
    output reg                  push1,
    output reg  [DATA_SIZE-1:0] data0,
    output reg  [DATA_SIZE-1:0] data1     
    );
    
    always@( * ) begin
        data0   = 'b0;
        data1   = 'b0;
        push0   = 'b0;
        push1   = 'b0;
        //Logica para arqui.v:
        //vc_id   =  data_in[DATA_SIZE -1];
        //selector = vc_id ? vc_id : 'b0;// toggle del selector
        
        if ( en_pop ) begin
           //seleccion de logicas
            data0 = ~selector ? data_in : 'b0;
            push0 = ~selector ? 1 : 'b0;
            
            data1 = selector ? data_in : 'b0;
            push1 = selector ? 1 : 'b0;
        end 
    end

endmodule

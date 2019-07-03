`timescale 1ns/1ps

module mux #(
    parameter DATA_SIZE = 4 
    )(
    input                       selector,
    input                       clk,
    input                       pop_delay_VC0,      //funciona como un enable
    input       [DATA_SIZE-1:0] data_VC0,
    input       [DATA_SIZE-1:0] data_VC1,
    output reg  [DATA_SIZE-1:0] data_out
);
//reg selector, dest;

    always@( * ) begin
        data_out = 'b0;
        //Logica para arqui.v:
        //dest  =  data_in[DATA_SIZE-2];
        //Selector = dest ? dest : 'b0;// toggle del selector

        if(pop_delay_VC0)begin
            data_out =  selector ? data_VC1 : data_VC0;
        end
    end

endmodule

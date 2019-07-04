`timescale 1ns/1ps

module mux #(
    parameter DATA_SIZE = 4 
    )(
    //input                       selector,
    input                       clk,
    input                       pop_delay_VC0,      //funciona como un enable
    input                       pop_delay_VC1,      //funciona como un enable
    input       [DATA_SIZE-1:0] data_mux0,
    input       [DATA_SIZE-1:0] data_mux1,
    output reg  [DATA_SIZE-1:0] data_demux
);
    reg         [DATA_SIZE-1:0] reg_VC0, reg_VC1;

    always@( * ) begin
        
        //Seleccion interna de valids
        reg_VC0 = pop_delay_VC0 ? data_mux0 : 'b0;  
        reg_VC1 = pop_delay_VC1 ? data_mux1 : 'b0; 
        data_demux =  pop_delay_VC0 ? reg_VC0 : reg_VC1;
    end

endmodule

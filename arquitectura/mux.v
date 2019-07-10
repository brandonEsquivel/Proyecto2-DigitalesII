`timescale 1ns/1ps

module mux #(
    parameter DATA_SIZE = 6 
    )(
    //input                       selector,
    input                       clk,
    input                       pop_delay_vc0,      //funciona como un enable
    input                       pop_delay_vc1,      //funciona como un enable
    input       [DATA_SIZE-1:0] data_mux_0,
    input       [DATA_SIZE-1:0] data_mux_1,
    output reg  [DATA_SIZE-1:0] data_demux_d,
    output reg valid_demux_d
);
    reg         [DATA_SIZE-1:0] reg_VC0, reg_VC1;

    always @(*)begin
    reg_VC0=0;
    reg_VC1=0;
    // valid_demux_d=0;
        if (pop_delay_vc0) begin
            // valid_demux_d=1;
            reg_VC0=data_mux_0;
        end else begin
            reg_VC0=0;
            // valid_demux_d=0;
        end

        if (pop_delay_vc1) begin
            reg_VC1=data_mux_1;
            // valid_demux_d=1;
        end else begin
            reg_VC1=0;
            // valid_demux_d=0;
        end    
    end

    
    
    
    always@( posedge clk)begin
        data_demux_d <=  pop_delay_vc0 ? reg_VC0 : reg_VC1;
        valid_demux_d <= pop_delay_vc0 || pop_delay_vc1;
    end
endmodule

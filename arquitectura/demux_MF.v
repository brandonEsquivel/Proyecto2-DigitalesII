module demux_MF(
    input clk,
    input reset_L,
    input [4:0]data_in,
    input selector,
    input pause_VC0,
    input pause_VC1,
    input empty_mF,
    output reg push_signal0,
    output reg push_signal1,
    output reg pop_signal,
    output reg [4:0]data_out0,
    output reg [4:0]data_out1

);

always @(posedge clk)begin
    if(~reset_L)begin
        push_signal1<='b0;
        push_signal2<='b0;
        pop_signal<='b0;
        data_out0<='b0;
        data_out1<='b0;
    end
    else begin
        if( !(pause_VC0||pause_VC1) && !empty_mF)begin
            pop_signal<='b1;
            if(selector)begin
                data_out1<=data_in;
                push_signal1<='b1;
                
                data_out0<='b0;
                push_signal0<='b0;
            end
            else begin
                data_out0<=data_in;
                push_signal0<='b1;

                data_out1<='b0;
                push_signal1<='b0;
            end
        end 
    end
    
end



endmodule
module output_flow(
    input reset_L,
    input clk,
    input vc0_empty,
    input vc1_empty,
    input d0_pause,
    input d1_pause,
    output reg pop_to_vc0,
    output reg pop_to_vc1,
    output reg pop_to_b0,
    output reg pop_to_b1);
// cambios
    always @(*)begin
        if(~reset_L)begin
            pop_to_b0='b0;
            pop_to_b1='b0;
            pop_to_vc0='b0;
            pop_to_vc1='b0;
        end
        else begin 
            pop_to_b0= (!(d0_pause|d1_pause))&&(!vc0_empty);
            pop_to_vc0= (!(d0_pause|d1_pause))&&(!vc0_empty);
            pop_to_b1= (!(d0_pause|d1_pause))&&(!vc1_empty)&&vc0_empty;
            pop_to_vc1= (!(d0_pause|d1_pause))&&(!vc1_empty)&&vc1_empty; 
        end
    end


endmodule
module input_flow(
    input reset_L,
    input pause_vc0,
    input pause_vc1,
    input empty_main_FIFO,
    output reg pop_to_MF,
    output reg pop_to_b
);
// cambios
always @(*)begin
    if(~reset_L)begin
        pop_to_MF='b0;
        pop_to_b='b0;
    end
    else begin
       if ( !(pause_vc0|pause_vc1) && !empty_main_FIFO) begin
           pop_to_MF='b1;
           pop_to_b='b1;
       end 
       else begin
           pop_to_MF='b0;
           pop_to_b='b0;
       end 
    end
end


endmodule
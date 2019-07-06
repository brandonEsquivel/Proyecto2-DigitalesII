module input_flow(
    input reset_L,
    input fifo_pause_vc0,
    input fifo_pause_vc1,
    input fifo_empty_main,
    output reg pop_main_cond,
    output reg pop_b_cond
);
// cambios
always @(*)begin
    if(~reset_L)begin
        pop_main_cond='b0;
        pop_b_cond='b0;
    end
    else begin
       if ( !(fifo_pause_vc0|fifo_pause_vc1) && !fifo_empty_main) begin
           pop_main_cond='b1;
           pop_b_cond='b1;
       end 
       else begin
           pop_main_cond='b0;
           pop_b_cond='b0;
       end 
    end
end


endmodule
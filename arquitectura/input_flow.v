module input_flow(
    input reset_L,
    input fifo_pause_vc0,
    input fifo_pause_vc1,
    input fifo_empty_main,
    input fifo_error_main,
    output reg pop_main,
    output reg pop_b,
    output reg valid_out_main
);
// cambios
always @(*)begin
    if(~reset_L)begin
        pop_main='b0;
        pop_b='b0;
        valid_out_main='b0;
    end
    else begin
       if ( !(fifo_pause_vc0|fifo_pause_vc1) && !fifo_empty_main) begin
           pop_main='b1;
           pop_b='b1;
       end 
       else begin
           pop_main='b0;
           pop_b='b0;
       end 
       valid_out_main= (pop_main)&& (!fifo_error_main);
    end
end


endmodule
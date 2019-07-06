module output_flow(
    // input reset_L,
    input fifo_empty_vc0,
    input fifo_empty_vc1,
    input fifo_pause_d0,
    input fifo_pause_d1,
    output reg pop_vc0_cond,
    output reg pop_vc1_cond,
    output reg pop_b0_cond,
    output reg pop_b1_cond);
// cambios
    always @(*)begin
        // // if(~reset_L)begin
        //     pop_b0_cond='b0;
        //     pop_b1_cond='b0;
        //     pop_vc0_cond='b0;
        //     pop_vc1_cond='b0;
        // // end
        
            pop_b0_cond= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc0);
            pop_vc0_cond= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc0);
            pop_b1_cond= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc1)&&fifo_empty_vc0;
            pop_vc1_cond= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc1)&&fifo_empty_vc1; 
        // end
    end


endmodule
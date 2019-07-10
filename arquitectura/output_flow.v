module output_flow(
    // input reset_L,
    input fifo_empty_vc0,
    input fifo_empty_vc1,
    input fifo_pause_d0,
    input fifo_pause_d1,
    output reg pop_vc0,
    output reg pop_vc1,
    output reg pop_b0,
    output reg pop_b1);
// cambios
    always @(*)begin
        // // if(~reset_L)begin
        //     pop_b0='b0;
        //     pop_b1='b0;
        //     pop_vc0='b0;
        //     pop_vc1='b0;
        // // end
        
            pop_b0= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc0);
            pop_vc0= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc0);
            pop_b1= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc1)&&fifo_empty_vc0;
            pop_vc1= (!(fifo_pause_d0|fifo_pause_d1))&&(!fifo_empty_vc1)&&fifo_empty_vc1; 
        // end
    end


endmodule
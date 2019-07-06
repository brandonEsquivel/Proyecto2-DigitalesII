module buffer(
    input clk,
    input reset_L,
    input pop_b,
    output reg pop_delay_vc
);
reg [1:0]contador;
reg atraso_d;
reg atraso_dd;

always @(posedge clk)begin
    if(!reset_L)begin
        contador<='b0;
        pop_delay_vc<='b0;
        atraso_d<='b0;
        atraso_dd<='b0;
    end
    else begin
        contador<=contador+1;
        atraso_d<=pop_b;
        atraso_dd<=atraso_d;
        if(contador==2)begin
            pop_delay_vc<=atraso_dd;
            contador<='b0;
        end
    end
end



endmodule
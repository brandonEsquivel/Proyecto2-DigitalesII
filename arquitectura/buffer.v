module buffer(
    input clk,
    input reset_L,
    input selector,
    output reg selector_atrasado
);
reg [1:0]contador;
reg atraso_d;
reg atraso_dd;

always @(posedge clk)begin
    if(!reset_L)begin
        contador<='b0;
        selector_atrasado<='b0;
        atraso_d<='b0;
        atraso_dd<='b0;
    end
    else begin
        contador<=contador+1;
        atraso_d<=selector;
        atraso_dd<=atraso_d;
        if(contador==2)begin
            selector_atrasado<=atraso_dd;
            contador<='b0;
        end
    end
end



endmodule
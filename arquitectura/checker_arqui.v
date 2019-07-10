/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo checker
*@author Moisés Campos Zepeda
*22/06/2019 
*@brief Checker para comparar comportamiento conductual con el estructural
*/

module checker_arqui (
    output reg     arqui_checks_out,        //salida que indica que ambos datos de la salida son iguales
    input       clk,
    input       reset_L,
    input [3:0] salida_arqui0_c,
    input [3:0] salida_arqui0_e,
    input [3:0] salida_arqui1_c,
    input [3:0] salida_arqui1_e,
    input       salida_arqui2_c,
    input       salida_arqui2_e,
    input       salida_arqui3_c,
    input       salida_arqui3_e,
    input       salida_arqui4_c,
    input       salida_arqui4_e
);
     //flip-flops
    reg out0_c, out0_e, out1_c, out1_e, out2_c, out2_e, out3_c, out3_e, out4_c, out4_e; 
    
    reg onflag, resetflag;                         //checks if message has been sent   
    always@( * ) begin
        if( !reset_L ) begin
            out0_c =   'b0;
            out0_e =   'b0;
            out1_c =   'b0;
            out1_e =   'b0;
            out2_c =   'b0;
            out2_e =   'b0;
            out3_c =   'b0;
            out3_e =   'b0;
            out4_c =   'b0;
            out4_e =   'b0;
            onflag  =   'b0;
            arqui_checks_out = 1;
        end else begin      
            out0_c = salida_arqui0_c;
            out0_e = salida_arqui0_e;
            out1_c = salida_arqui1_c;
            out1_e = salida_arqui1_e;
            out2_c = salida_arqui2_c;
            out2_e = salida_arqui2_e;
            out3_c = salida_arqui3_c;
            out3_e = salida_arqui3_e;
            out4_c = salida_arqui4_c;
            out4_e = salida_arqui4_e;
           
            if( reset_L ) begin        //comparacion en los flancos del reloj
                if(     (out0_c == out0_e)
                    &&  (out1_c == out1_e)
                    &&  (out2_c == out2_e)
                    &&  (out3_c == out3_e)
                    &&  (out4_c == out4_e)  )begin
                    arqui_checks_out = 1;
                    resetflag = 1; 
                end else begin
                    arqui_checks_out = 'b0;
                    if ( ( !onflag )  && ( resetflag == 1 ) ) begin
                        $display( $time, " ns, Error: Modules differ!!" );
                        onflag = 1;
                    end
                end
            end 
        end
    end
endmodule



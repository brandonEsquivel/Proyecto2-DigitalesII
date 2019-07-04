/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo checker
*@author Moisés Campos Zepeda
*22/06/2019 
*@brief Checker para comparar comportamiento conductual con el estructural
*/

module checker_demux(
    output reg      demux_checks_out,        //salida que indica que ambos datos de la salida son iguales
    input           clk,
    input           reset_L,
    input   [4:0]   salida_demux0_c,
    input   [4:0]   salida_demux0_e,
    input           salida_demux1_c,
    input           salida_demux1_e
);
    reg     out_c0, out_c1, out_e0, out_e1;                   //flip-flops
    reg     onflag, resetflag;                         //checks if message has been sent   
    always@( * ) begin
        if( !reset_L ) begin
            out_c0  =   'b0;
            out_e0  =   'b0;
            out_c1  =   'b0;
            out_e1  =   'b0;
            onflag =   'b0;
            demux_checks_out <= 1;
        end else begin      
            out_c0 = salida_demux0_c;
            out_e0 = salida_demux0_e;
            out_c1 = salida_demux1_c;
            out_e1 = salida_demux1_e;
           
            if( reset_L == 1 ) begin        //comparacion en los flancos del reloj
                if( out_c0 == out_e0 && out_c1 == out_e1 ) begin
                    demux_checks_out = 1;
                    resetflag =1; 
                end else begin
                    demux_checks_out = 'b0;
                    if ( ( !onflag )  && ( resetflag == 1 ) ) begin
                        $display( $time, " ns, Error: Modules differ!!" );
                        onflag = 1;
                    end
                end
            end 
        end
    end
endmodule



/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo checker
*@author Moisés Campos Zepeda
*14/06/2019 
*@brief Checker para comparar comportamiento conductual con el estructural
*/

module checker_RAM #(
    parameter OUTPUT_SIZE=4                //Cantida de bits de la salida 

)(
    output reg      RAM_checks_out,        //salida que indica que ambos datos de la salida son iguales
    input           clk,
    input          reset_L,
    input   [OUTPUT_SIZE-1:0]  salida_gray_c,
    input   [OUTPUT_SIZE-1:0]   salida_gray_e
);
    reg     out_c, out_e;                   //flip-flops
    reg     onflag, resetflag;                         //checks if message has been sent   
    always@( * ) begin
        if( !reset_L ) begin
            out_c  =   'b0;
            out_e  =   'b0;
            onflag =   'b0;
            RAM_checks_out <= 1;
        end else begin      
            out_c = salida_gray_c;
            out_e = salida_gray_e;
           
            if( reset_L == 1 ) begin        //comparacion en los flancos del reloj
                if( out_c == out_e ) begin
                    RAM_checks_out = 1;
                    resetflag =1; 
                end else begin
                    RAM_checks_out = 'b0;
                    if ( ( !onflag )  && ( resetflag == 1 ) ) begin
                        $display( $time, " ns, Error: Modules differ!!" );
                        onflag = 1;
                    end
                end
            end 
        end
    end
endmodule



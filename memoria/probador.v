/*
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   14/06/2019
*@brief  Probador del modulo RAM_memory para modelo conductual y el estructural dado
 */

`include "checker_RAM.v"

module probador #(
    //Parametros
    parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
    parameter DATA_SIZE = 6             //cantidad de bits de entrada 
)(
	output reg                          clk, 
    output reg							read,         //enable del read
    output reg							write,        //enable del write
	output reg                          reset_L,
	output reg [DATA_SIZE-1:0]          wr_ptr,
	output reg [DATA_SIZE-1:0]          rd_ptr,
	output reg [MAIN_QUEUE_SIZE-1:0]    data_in,
	input      [MAIN_QUEUE_SIZE-1:0]    data_out);

//reg f2_cond,f2_estruct,f_cond,f_estruct;

    checker_RAM RAM_checkout(/*AUTOINST*/);

 initial begin

    $dumpfile("RAM_memory.vcd");        //Dumpfile to make in current folder
    $dumpvars;
    data_in <= 	'b0;
    wr_ptr <= 	'b0;					//se resetea direccion
    rd_ptr <= 	'b0;                    //se resetea direccion
    reset_L <= 	'b0;                    //a relojes se resetean            

    //prueba de escritura
    @(posedge clk)
    reset_L <= 1; 
    write <= 1;
    
    repeat(20)begin
        @(posedge clk)
        //mandar direcciones random a wr_ptr
        data_in <= data_in + 1;
        wr_ptr <= wr_ptr + 1;
    end
        # 20;

        @(posedge clk)
        read <= 1;

     repeat(20)begin
        @(posedge clk)
        //mandar direcciones random a wr_ptr
        data_in <= data_in + 1;
        rd_ptr <= rd_ptr + 1;
     end
        

        # 20;
      data_in <= 	'b0;
     repeat(20)begin  
        @(posedge clk)
        reset_L <= 0;
     end
     $finish;
end

    always # 2 clk <= ~clk;       //genera señal 4 ns 

endmodule

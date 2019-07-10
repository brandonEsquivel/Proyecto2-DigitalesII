/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo probador del arqui
 *@author Giancarlo Marin H., Moises Campos Z. 
 *@date   02/07/2019
 *@brief  Modulo que genera las señales y monitoriza las salidas del modulo arqui conductual y estructural sintetizado
*/

`include "checker_arqui.v"
module probador #(   
        parameter DATA_SIZE = 6, 
        parameter OUTPUT_SIZE = 4
    )(
        output reg                      clk,
        output reg                      reset_L,
        output reg [DATA_SIZE-1:0]      data_in,            //datos para hacerle push 
        output reg                      push_main,
        output reg                      pop_d0,
        output reg                      pop_d1,
        output reg                      init,
        
        output reg                      fifo_pause_main,
        output reg                      fifo_empty_d0,
        output reg                      fifo_empty_d1,

        output reg [1:0]                afMF_i,            // almost full Main FIFO
        output reg [1:0]                aeMF_i,            // almost empty Main FIFO
        output reg [3:0]                afVC_i,                 // almost full VC FIFO
        output reg [3:0]                aeVC_i,            // almost empty VC FIFO
        output reg [1:0]                afDF_i,            // almost full D FIFO
        output reg [1:0]                aeDF_i,            // almost empty D FIFO
        
        input                           error_out_c,
        input                           error_out_e,

        input                           active_out_c,
        input                           active_out_e,

        input                           idle_out_c,
        input                           idle_out_e, 
        
        input   [DATA_SIZE-1:0]         data_out0_c,	// monitor de salida 0 de datos cond
        input   [DATA_SIZE-1:0]	        data_out0_e,	    // monitor de salida 0 de datos estr
        
        input   [DATA_SIZE-1:0]	        data_out1_c,	// monitor de salida 0 de datos cond
        input   [DATA_SIZE-1:0]	        data_out1_e	    // monitor de salida 0 de datos estr
);

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			arqui_checks_out;	// From ch0 of checker_arqui.v
// End of automatics

//seleccion 
reg select;

    checker_arqui ch0(/*autoinst*/
		      // Outputs
		      .arqui_checks_out	(arqui_checks_out),
		      // Inputs
		      .clk		(clk),
		      .reset_L		(reset_L),
		      .salida_arqui0_c	(data_out0_c[5:0]),
		      .salida_arqui0_e	(data_out0_e[5:0]),
		      .salida_arqui1_c	(data_out1_c[5:0]),
		      .salida_arqui1_e	(data_out1_e[5:0]),
		      .salida_arqui2_c	(error_out_c),
		      .salida_arqui2_e	(error_out_e),
		      .salida_arqui3_c	(active_out_c),
		      .salida_arqui3_e	(active_out_e),
		      .salida_arqui4_c	(idle_out_c),
		      .salida_arqui4_e	(idle_out_e));

	initial begin
		$dumpfile("arqui.vcd");		// archivo "dump"
		$dumpvars;					// dumping de variables
		// Mensajes en consola 
		//$display ("\tclk\tdata_VC0\tcheck_out0 check_out1");
		//$monitor($time,"\t%b\t%b\t%x %b\t%x %b\t%b %b", clk,  data_VC0, check_out0,check_out1);
		// Prueba#0: valores iniciales
        
            reset_L     <= 'b0;
            data_in     <= 'b0; 					
            init        <= 'b0; 					
	        pop_d0      <= 'b0;
            pop_d1      <= 'b0;    
            push_main   <= 'b0;

		// Prueba#1: reset activado
        @(posedge clk);
            reset_L <= 1;
            data_in <= 'b0;
        @ (posedge clk)
            data_in <= 'h0f;
            push_main <= 0;
            
        // Prueba #2: umbrales para la maquina de estados
			@(posedge clk) begin
				data_in <= data_in - 1;
                afMF_i  <=  3;
                aeMF_i  <=  1;
                afVC_i  <=  14;
                aeVC_i  <=  3;
                afDF_i  <=  1;
                aeDF_i  <=  3;

				push_main <= 1;
			end

        #10;
        $finish;	
	end
	
    // Generador del clk
	initial clk <= 0;				// Valor inicial del clk
	always #2 clk <= ~clk;			// toggle cada 10ns
    
    always@(*) begin
        if(!fifo_pause_main) begin
            push_main = 1;
        end else
            push_main = 0;
    end


endmodule

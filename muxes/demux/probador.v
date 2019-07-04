/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo probador del demux
 *@author Giancarlo Marin H.
 *@date   02/07/2019
 *@brief  Modulo que genera las señales y monitoriza las salidas del modulo mux conductual y estructural sintetizado
*/

`include "checker_demux.v"

module probador #(
    parameter  DATA_SIZE = 4 )(
	output reg                      reset_L,     
    output reg                      selector,
    output reg 				        clk,			// generador del clock
    output reg                      en_pop,
	output reg  [DATA_SIZE-1:0]	    data_in,		// generador de la entrada de dato 0
    input                           push0_c,
    input                           push0_e,
    input                           push1_c,
    input                           push1_e,
    input       [DATA_SIZE-1:0]	    data_out0_c,	// monitor de salida 0 de datos cond
	input       [DATA_SIZE-1:0]	    data_out0_e,	// monitor de salida 0 de datos estr
	input       [DATA_SIZE-1:0]	    data_out1_c,	// monitor de salida 1 de datos cond
	input       [DATA_SIZE-1:0]	    data_out1_e 	// monitor de salida 1 de datos estr
	);

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			demux_checks_out;	// From c0 of checker_demux.v
// End of automatics
/*AUTOREGINPUT*/
// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
//reg [4:0]		salida_demux0_c;	// To c0 of checker_demux.v
//reg [4:0]		salida_demux0_e;	// To c0 of checker_demux.v
//reg			    salida_demux1_c;	// To c0 of checker_demux.v
//reg			    salida_demux1_e;	// To c0 of checker_demux.v
// End of automatics

    checker_demux c0(/*autoinst*/
		     // Outputs
		     .demux_checks_out	(demux_checks_out),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .salida_demux0_c	(data_out0_c[4:0]),
		     .salida_demux0_e	(data_out0_e[4:0]),
		     .salida_demux1_c	(push0_c),
		     .salida_demux1_e	(push0_e));

	initial begin
		$dumpfile("demux.vcd");		// archivo "dump"
		$dumpvars;					// dumping de variables
		// Mensajes en consola 
		//$display ("\tclk\tdata_in\tcheck_out0 check_out1");
		//$monitor($time,"\t%b\t%b\t%x %b\t%x %b\t%b %b", clk,  data_in, check_out0,check_out1);
		// Pruebas
		data_in <= 'b0; 					
        en_pop <= 'b0;
        selector <= 'b0;

		@(posedge clk);
		// Sincroniza
		@(posedge clk);
        reset_L <= 'b0;
		data_in <= 'hf;
        en_pop <= 1;
		repeat(3) begin
			@(posedge clk) begin
                reset_L <= 1;
				data_in <= data_in - 'h1;
			end
		end
		// Prueba #3: Espera
		@(posedge clk) begin
			en_pop <= 0;
            selector <= 1;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba #4: Continua la entrada de dato_in por dos ciclos mas
		@(posedge clk) begin
			en_pop <= 1;
			data_in <= 'h3;
		end
		@(posedge clk) begin
			data_in <= 'h4;
            selector<= 'b0;
		end
		@(posedge clk) begin
			en_pop <= 0;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba #5: Prueba del funcionamiento de selector interno con entrada de mas datos
		@(posedge clk) begin
			en_pop <= 1;
			data_in <= 'ha;
		end
		@(posedge clk) begin
			data_in <= 'h9;
            selector <= 1;
		end
		@(posedge clk) begin
			en_pop <= 0;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba #6: Ultima entrada de datos
		@(posedge clk) begin
			en_pop <= 1;
			data_in <= 'h7;
		end
		@(posedge clk) begin
			data_in <= 'h8;
		end
		@(posedge clk) begin
			en_pop <= 0;
            selector <= 'b0;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba 7: Reset alto y termina de almacenar señales
		@(posedge clk);
		#10 $finish;	
	end
	// Generador del clk
	initial	clk <= 0;				// Valor inicial del clk
	always #10 clk <= ~clk;			// toggle cada 10ns
endmodule

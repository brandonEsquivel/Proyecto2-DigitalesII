/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo probador del mux
 *@author Giancarlo Marin H.
 *@date   02/07/2019
 *@brief  Modulo que genera las señales y monitoriza las salidas del modulo mux conductual y estructural sintetizado
*/

`include "checker_mux.v"

module probador #(
    parameter  DATA_SIZE = 4 )(
	output reg              selector,
    output reg              reset_L,     
    output reg 				clk,			// generador del clock
    output reg              pop_delay_VC0,
	output reg  [DATA_SIZE-1:0]	    data_VC0,		// generador de la entrada de dato 0
	output reg  [DATA_SIZE-1:0]	    data_VC1,		// generador de la entrada de dato 0
    input       [DATA_SIZE-1:0]	    data_out0_c,	// monitor de salida 0 de datos cond
	input       [DATA_SIZE-1:0]	    data_out0_e	    // monitor de salida 0 de datos estr
	);

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			mux_checks_out;		// From c0 of checker_mux.v
// End of automatics
/*AUTOREGINPUT*/
// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
reg [4:0]		salida_mux_c;		// To c0 of checker_mux.v
reg [4:0]		salida_mux_e;		// To c0 of checker_mux.v
// End of automatics

    checker_mux c0(/*autoinst*/
		   // Outputs
		   .mux_checks_out	(mux_checks_out),
		   // Inputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .salida_mux_c	(data_out0_c[4:0]),
		   .salida_mux_e	(data_out0_e[4:0]));

	initial begin
		$dumpfile("mux.vcd");		// archivo "dump"
		$dumpvars;					// dumping de variables
		// Mensajes en consola 
		//$display ("\tclk\tdata_VC0\tcheck_out0 check_out1");
		//$monitor($time,"\t%b\t%b\t%x %b\t%x %b\t%b %b", clk,  data_VC0, check_out0,check_out1);
		// Pruebas
        pop_delay_VC0 <= 'b0;
		data_VC0    <= 'b0; 					
		data_VC1    <= 'b0; 					
		@(posedge clk);
		// Sincroniza
		@(posedge clk);
        reset_L <= 'b0;
        selector <= 0;
		data_VC0 <= 'hf;
		data_VC1 <= 'h5;
        pop_delay_VC0 <= 1;
		repeat(3) begin
			@(posedge clk) begin
                reset_L <= 1;
				data_VC0 <= data_VC0 - 'h1;
				data_VC1 <= data_VC1 - 'h1;
			end
		end
		// Prueba #3: Espera
		@(posedge clk) begin
            selector <= 1;
			pop_delay_VC0 <= 0;
		end
		@(posedge clk);
		// Prueba #4: Continua la entrada de dato_in por dos ciclos mas
        selector <= 0;
		@(posedge clk) begin
			pop_delay_VC0 <= 1;
			data_VC0 <= 'h3;
			data_VC1 <= 'h5;
		end
		@(posedge clk) begin
			data_VC1 <= 'h4;
			data_VC0 <= 'h6;
		end
		@(posedge clk) begin
			pop_delay_VC0 <= 0;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba #5: Prueba del funcionamiento de selector interno con entrada de mas datos
		@(posedge clk) begin
            selector <= 1;
			pop_delay_VC0 <= 1;
			data_VC1 <= 'ha;
		end
		@(posedge clk) begin
			data_VC0 <= 'h9;
		end
		@(posedge clk) begin
			pop_delay_VC0 <= 0;
		end
		@(posedge clk);
		@(posedge clk);
		// Prueba #6: Ultima entrada de datos
		@(posedge clk) begin
			pop_delay_VC0 <= 1;
			data_VC1 <= 'h7;
		end
		@(posedge clk) begin
			data_VC0 <= 'h8;
		end
		@(posedge clk) begin
			pop_delay_VC0 <= 0;
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

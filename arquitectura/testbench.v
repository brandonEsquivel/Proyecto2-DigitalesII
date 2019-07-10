/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #2 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda, Giancarlo Marín
 *@date   02/07/2019
 *@brief  Banco de pruebas de la arquitectura con su respectivo probador
*/

`timescale 	1ns	/ 100ps		// escala
// includes de archivos de verilog
`include "arqui.v"
//`include "arqui_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench; // Testbench
//parameter DATA_SIZE = 4;
	/*AUTOWIRE*/
	// End of automatics
    /*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    arqui arqui_cond(/*AUTOINST*/);

//	arqui_Synth arqui_est(/*AUTOINST*/);	
    
    probador test(/*AUTOINST*/);

endmodule // testbench

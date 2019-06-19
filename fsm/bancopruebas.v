`timescale 	1ns	/ 100ps		
`include "fsm.v"
`include "probador.v"
`include "fsm_synth.v"

module testbench; // Testbench
    
    
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [4:0]		FIFO_empties;		// From probador of probador.v
    wire [4:0]		FIFO_errors;		// From probador of probador.v
    wire		active_out_cond;	// From cond of fsm.v
    wire		active_out_estruct;	// From estruct of fsm_synth.v
    wire [2:0]		aeDs;			// From probador of probador.v
    wire [2:0]		aeMFs;			// From probador of probador.v
    wire [2:0]		aeVCs;			// From probador of probador.v
    wire [2:0]		afDs;			// From probador of probador.v
    wire [2:0]		afMFs;			// From probador of probador.v
    wire [2:0]		afVCs;			// From probador of probador.v
    wire		clk;			// From probador of probador.v
    wire [4:0]		error_out_cond;		// From cond of fsm.v
    wire [4:0]		error_out_estruct;	// From estruct of fsm_synth.v
    wire		idle_out_cond;		// From cond of fsm.v
    wire		idle_out_estruct;	// From estruct of fsm_synth.v
    wire		init;			// From probador of probador.v
    wire		reset_L;		// From probador of probador.v
    // End of automatics
    /*AUTOREG*/
	fsm cond(/*AUTOINST*/
		 // Outputs
		 .error_out_cond	(error_out_cond[4:0]),
		 .active_out_cond	(active_out_cond),
		 .idle_out_cond		(idle_out_cond),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .init			(init),
		 .FIFO_errors		(FIFO_errors[4:0]),
		 .FIFO_empties		(FIFO_empties[4:0]),
		 .afMFs			(afMFs[2:0]),
		 .aeMFs			(aeMFs[2:0]),
		 .afVCs			(afVCs[2:0]),
		 .aeVCs			(aeVCs[2:0]),
		 .afDs			(afDs[2:0]),
		 .aeDs			(aeDs[2:0]));
	fsm_synth estruct(/*AUTOINST*/
			  // Outputs
			  .active_out_estruct	(active_out_estruct),
			  .error_out_estruct	(error_out_estruct[4:0]),
			  .idle_out_estruct	(idle_out_estruct),
			  // Inputs
			  .FIFO_empties		(FIFO_empties[4:0]),
			  .FIFO_errors		(FIFO_errors[4:0]),
			  .aeDs			(aeDs[2:0]),
			  .aeMFs		(aeMFs[2:0]),
			  .aeVCs		(aeVCs[2:0]),
			  .afDs			(afDs[2:0]),
			  .afMFs		(afMFs[2:0]),
			  .afVCs		(afVCs[2:0]),
			  .clk			(clk),
			  .init			(init),
			  .reset_L		(reset_L));
	probador probador (/*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .init		(init),
			   .FIFO_errors		(FIFO_errors[4:0]),
			   .FIFO_empties	(FIFO_empties[4:0]),
			   .afMFs		(afMFs[2:0]),
			   .aeMFs		(aeMFs[2:0]),
			   .afVCs		(afVCs[2:0]),
			   .aeVCs		(aeVCs[2:0]),
			   .afDs		(afDs[2:0]),
			   .aeDs		(aeDs[2:0]),
			   // Inputs
			   .error_out_cond	(error_out_cond[4:0]),
			   .active_out_cond	(active_out_cond),
			   .idle_out_cond	(idle_out_cond),
			   .error_out_estruct	(error_out_estruct[4:0]),
			   .active_out_estruct	(active_out_estruct),
			   .idle_out_estruct	(idle_out_estruct));

endmodule

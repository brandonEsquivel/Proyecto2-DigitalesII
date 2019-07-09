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
    wire [1:0]		aeD_o_cond;		// From cond of fsm.v
    wire [1:0]		aeD_o_estruct;		// From estruct of fsm_synth.v
    wire [1:0]		aeDs_i;			// From probador of probador.v
    wire [1:0]		aeMF_i;			// From probador of probador.v
    wire [1:0]		aeMF_o_cond;		// From cond of fsm.v
    wire [1:0]		aeMF_o_estruct;		// From estruct of fsm_synth.v
    wire [3:0]		aeVC_o_cond;		// From cond of fsm.v
    wire [3:0]		aeVC_o_estruct;		// From estruct of fsm_synth.v
    wire [3:0]		aeVCs_i;		// From probador of probador.v
    wire [1:0]		afD_o_cond;		// From cond of fsm.v
    wire [1:0]		afD_o_estruct;		// From estruct of fsm_synth.v
    wire [1:0]		afDs_i;			// From probador of probador.v
    wire [1:0]		afMF_i;			// From probador of probador.v
    wire [1:0]		afMF_o_cond;		// From cond of fsm.v
    wire [1:0]		afMF_o_estruct;		// From estruct of fsm_synth.v
    wire [3:0]		afVC_o_cond;		// From cond of fsm.v
    wire [3:0]		afVC_o_estruct;		// From estruct of fsm_synth.v
    wire [3:0]		afVCs_i;		// From probador of probador.v
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
		 .afMF_o_cond		(afMF_o_cond[1:0]),
		 .aeMF_o_cond		(aeMF_o_cond[1:0]),
		 .afD_o_cond		(afD_o_cond[1:0]),
		 .aeD_o_cond		(aeD_o_cond[1:0]),
		 .afVC_o_cond		(afVC_o_cond[3:0]),
		 .aeVC_o_cond		(aeVC_o_cond[3:0]),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .init			(init),
		 .FIFO_errors		(FIFO_errors[4:0]),
		 .FIFO_empties		(FIFO_empties[4:0]),
		 .afMF_i		(afMF_i[1:0]),
		 .aeMF_i		(aeMF_i[1:0]),
		 .afVCs_i		(afVCs_i[3:0]),
		 .aeVCs_i		(aeVCs_i[3:0]),
		 .afDs_i		(afDs_i[1:0]),
		 .aeDs_i		(aeDs_i[1:0]));
	fsm_synth estruct(/*AUTOINST*/
			  // Outputs
			  .active_out_estruct	(active_out_estruct),
			  .aeD_o_estruct	(aeD_o_estruct[1:0]),
			  .aeMF_o_estruct	(aeMF_o_estruct[1:0]),
			  .aeVC_o_estruct	(aeVC_o_estruct[3:0]),
			  .afD_o_estruct	(afD_o_estruct[1:0]),
			  .afMF_o_estruct	(afMF_o_estruct[1:0]),
			  .afVC_o_estruct	(afVC_o_estruct[3:0]),
			  .error_out_estruct	(error_out_estruct[4:0]),
			  .idle_out_estruct	(idle_out_estruct),
			  // Inputs
			  .FIFO_empties		(FIFO_empties[4:0]),
			  .FIFO_errors		(FIFO_errors[4:0]),
			  .aeDs_i		(aeDs_i[1:0]),
			  .aeMF_i		(aeMF_i[1:0]),
			  .aeVCs_i		(aeVCs_i[3:0]),
			  .afDs_i		(afDs_i[1:0]),
			  .afMF_i		(afMF_i[1:0]),
			  .afVCs_i		(afVCs_i[3:0]),
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
			   .afMF_i		(afMF_i[1:0]),
			   .aeMF_i		(aeMF_i[1:0]),
			   .afVCs_i		(afVCs_i[3:0]),
			   .aeVCs_i		(aeVCs_i[3:0]),
			   .afDs_i		(afDs_i[1:0]),
			   .aeDs_i		(aeDs_i[1:0]),
			   // Inputs
			   .error_out_cond	(error_out_cond[4:0]),
			   .active_out_cond	(active_out_cond),
			   .idle_out_cond	(idle_out_cond),
			   .afMF_o_cond		(afMF_o_cond[1:0]),
			   .aeMF_o_cond		(aeMF_o_cond[1:0]),
			   .afD_o_cond		(afD_o_cond[1:0]),
			   .aeD_o_cond		(aeD_o_cond[1:0]),
			   .afVC_o_cond		(afVC_o_cond[3:0]),
			   .aeVC_o_cond		(aeVC_o_cond[3:0]),
			   .error_out_estruct	(error_out_estruct[4:0]),
			   .active_out_estruct	(active_out_estruct),
			   .idle_out_estruct	(idle_out_estruct),
			   .afMF_o_estruct	(afMF_o_estruct[1:0]),
			   .aeMF_o_estruct	(aeMF_o_estruct[1:0]),
			   .afD_o_estruct	(afD_o_estruct[1:0]),
			   .aeD_o_estruct	(aeD_o_estruct[1:0]),
			   .afVC_o_estruct	(afVC_o_estruct[3:0]),
			   .aeVC_o_estruct	(aeVC_o_estruct[3:0]));

endmodule

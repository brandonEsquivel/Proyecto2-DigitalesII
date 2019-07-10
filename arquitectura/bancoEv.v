`timescale 	1ns	/ 100ps		
`include "arqui.v"
`include "arqui_Synth.v"
`include "probadorEV.v"
`include "./CMOS/cmos_cells.v"

module bancoEV;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			active_out_cond;	// From cond of arqui.v
wire			active_out_estruct;	// From estruct of arqui_Synth.v
wire [1:0]		aeDF_i;			// From probador of probadorEV.v
wire [1:0]		aeMF_i;			// From probador of probadorEV.v
wire [3:0]		aeVC_i;			// From probador of probadorEV.v
wire [1:0]		afDF_i;			// From probador of probadorEV.v
wire [1:0]		afMF_i;			// From probador of probadorEV.v
wire [3:0]		afVC_i;			// From probador of probadorEV.v
wire			clk;			// From probador of probadorEV.v
wire [5:0]		data_in;		// From probador of probadorEV.v
wire [5:0]		data_out_0_cond;	// From cond of arqui.v
wire [5:0]		data_out_0_estruct;	// From estruct of arqui_Synth.v
wire [5:0]		data_out_1_cond;	// From cond of arqui.v
wire [5:0]		data_out_1_estruct;	// From estruct of arqui_Synth.v
wire [4:0]		error_out_cond;		// From cond of arqui.v
wire [4:0]		error_out_estruct;	// From estruct of arqui_Synth.v
wire			fifo_empty_d0_cond;	// From cond of arqui.v
wire			fifo_empty_d0_estruct;	// From estruct of arqui_Synth.v
wire			fifo_empty_d1_cond;	// From cond of arqui.v
wire			fifo_empty_d1_estruct;	// From estruct of arqui_Synth.v
wire			fifo_pause_main_cond;	// From cond of arqui.v
wire			fifo_pause_main_estruct;// From estruct of arqui_Synth.v
wire			idle_out_cond;		// From cond of arqui.v
wire			idle_out_estruct;	// From estruct of arqui_Synth.v
wire			init;			// From probador of probadorEV.v
wire			pop_d0;			// From probador of probadorEV.v
wire			pop_d1;			// From probador of probadorEV.v
wire			push_main;		// From probador of probadorEV.v
wire			reset_L;		// From probador of probadorEV.v
// End of automatics
/*AUTOREGINPUT*/
arqui_Synth estruct (/*AUTOINST*/
		     // Outputs
		     .active_out_estruct(active_out_estruct),
		     .data_out_0_estruct(data_out_0_estruct[5:0]),
		     .data_out_1_estruct(data_out_1_estruct[5:0]),
		     .error_out_estruct	(error_out_estruct[4:0]),
		     .fifo_empty_d0_estruct(fifo_empty_d0_estruct),
		     .fifo_empty_d1_estruct(fifo_empty_d1_estruct),
		     .fifo_pause_main_estruct(fifo_pause_main_estruct),
		     .idle_out_estruct	(idle_out_estruct),
		     // Inputs
		     .aeDF_i		(aeDF_i[1:0]),
		     .aeMF_i		(aeMF_i[1:0]),
		     .aeVC_i		(aeVC_i[3:0]),
		     .afDF_i		(afDF_i[1:0]),
		     .afMF_i		(afMF_i[1:0]),
		     .afVC_i		(afVC_i[3:0]),
		     .clk		(clk),
		     .data_in		(data_in[5:0]),
		     .init		(init),
		     .pop_d0		(pop_d0),
		     .pop_d1		(pop_d1),
		     .push_main		(push_main),
		     .reset_L		(reset_L));
arqui cond(/*AUTOINST*/
	   // Outputs
	   .fifo_pause_main_cond	(fifo_pause_main_cond),
	   .fifo_empty_d0_cond		(fifo_empty_d0_cond),
	   .fifo_empty_d1_cond		(fifo_empty_d1_cond),
	   .error_out_cond		(error_out_cond[4:0]),
	   .active_out_cond		(active_out_cond),
	   .idle_out_cond		(idle_out_cond),
	   .data_out_0_cond		(data_out_0_cond[5:0]),
	   .data_out_1_cond		(data_out_1_cond[5:0]),
	   // Inputs
	   .clk				(clk),
	   .reset_L			(reset_L),
	   .data_in			(data_in[5:0]),
	   .push_main			(push_main),
	   .pop_d0			(pop_d0),
	   .pop_d1			(pop_d1),
	   .init			(init),
	   .afMF_i			(afMF_i[1:0]),
	   .aeMF_i			(aeMF_i[1:0]),
	   .afVC_i			(afVC_i[3:0]),
	   .aeVC_i			(aeVC_i[3:0]),
	   .afDF_i			(afDF_i[1:0]),
	   .aeDF_i			(aeDF_i[1:0]));
probadorEV probador(/*AUTOINST*/
		    // Outputs
		    .clk		(clk),
		    .reset_L		(reset_L),
		    .data_in		(data_in[5:0]),
		    .push_main		(push_main),
		    .pop_d0		(pop_d0),
		    .pop_d1		(pop_d1),
		    .init		(init),
		    .afMF_i		(afMF_i[1:0]),
		    .aeMF_i		(aeMF_i[1:0]),
		    .afVC_i		(afVC_i[3:0]),
		    .aeVC_i		(aeVC_i[3:0]),
		    .afDF_i		(afDF_i[1:0]),
		    .aeDF_i		(aeDF_i[1:0]),
		    // Inputs
		    .fifo_pause_main_cond(fifo_pause_main_cond),
		    .fifo_empty_d0_cond	(fifo_empty_d0_cond),
		    .fifo_empty_d1_cond	(fifo_empty_d1_cond),
		    .error_out_cond	(error_out_cond[4:0]),
		    .active_out_cond	(active_out_cond),
		    .idle_out_cond	(idle_out_cond),
		    .data_out_0_cond	(data_out_0_cond[5:0]),
		    .data_out_1_cond	(data_out_1_cond[5:0]),
		    .fifo_pause_main_estruct(fifo_pause_main_estruct),
		    .fifo_empty_d0_estruct(fifo_empty_d0_estruct),
		    .fifo_empty_d1_estruct(fifo_empty_d1_estruct),
		    .error_out_estruct	(error_out_estruct[4:0]),
		    .active_out_estruct	(active_out_estruct),
		    .idle_out_estruct	(idle_out_estruct),
		    .data_out_0_estruct	(data_out_0_estruct[5:0]),
		    .data_out_1_estruct	(data_out_1_estruct[5:0]));
endmodule // bancoEV

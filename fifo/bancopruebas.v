`timescale 	1ns	/ 100ps		
`include "fifo.v"
`include "fifoSynth.v"
`include "probador.v"
`include "./CMOS/cmos_cells.v"
// `include "RAM_memory.v"
module testbench; // Testbench
    //parameter MAIN_QUEUE_SIZE=4;
    parameter DATA_SIZE = 6; 
    
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [DATA_SIZE-1:0] buff_in;		// From probador of probador.v
    wire [DATA_SIZE-1:0] buffer_out_cond;	// From cond of fifo.v
    wire [5:0]		buffer_out_estruct;	// From estruct of fifoSynth.v
    wire		clk;			// From probador of probador.v
    wire		fifo_empty_cond;	// From cond of fifo.v
    wire		fifo_empty_estruct;	// From estruct of fifoSynth.v
    wire		fifo_error_cond;	// From cond of fifo.v
    wire		fifo_error_estruct;	// From estruct of fifoSynth.v
    wire		fifo_full_cond;		// From cond of fifo.v
    wire		fifo_full_estruct;	// From estruct of fifoSynth.v
    wire		fifo_pause_cond;	// From cond of fifo.v
    wire		fifo_pause_estruct;	// From estruct of fifoSynth.v
    wire		read;			// From probador of probador.v
    wire		reset_L;		// From probador of probador.v
    wire [DATA_SIZE-1:0] umb_almost_empty;	// From probador of probador.v
    wire [DATA_SIZE-1:0] umb_almost_full;	// From probador of probador.v
    wire		write;			// From probador of probador.v
    // End of automatics
    
    /*AUTOREGINPUT*/
	
	fifo cond(/*AUTOINST*/
		  // Outputs
		  .fifo_full_cond	(fifo_full_cond),
		  .fifo_empty_cond	(fifo_empty_cond),
		  .buffer_out_cond	(buffer_out_cond[DATA_SIZE-1:0]),
		  .fifo_error_cond	(fifo_error_cond),
		  .fifo_pause_cond	(fifo_pause_cond),
		  // Inputs
		  .clk			(clk),
		  .reset_L		(reset_L),
		  .read			(read),
		  .write		(write),
		  .buff_in		(buff_in[DATA_SIZE-1:0]),
		  .umb_almost_full	(umb_almost_full[DATA_SIZE-1:0]),
		  .umb_almost_empty	(umb_almost_empty[DATA_SIZE-1:0]));
	fifoSynth estruct(/*AUTOINST*/
			  // Outputs
			  .buffer_out_estruct	(buffer_out_estruct[5:0]),
			  .fifo_empty_estruct	(fifo_empty_estruct),
			  .fifo_error_estruct	(fifo_error_estruct),
			  .fifo_full_estruct	(fifo_full_estruct),
			  .fifo_pause_estruct	(fifo_pause_estruct),
			  // Inputs
			  .buff_in		(buff_in[5:0]),
			  .clk			(clk),
			  .read			(read),
			  .reset_L		(reset_L),
			  .umb_almost_empty	(umb_almost_empty[5:0]),
			  .umb_almost_full	(umb_almost_full[5:0]),
			  .write		(write));
	probador probador (/*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .read		(read),
			   .write		(write),
			   .buff_in		(buff_in[DATA_SIZE-1:0]),
			   .umb_almost_full	(umb_almost_full[DATA_SIZE-1:0]),
			   .umb_almost_empty	(umb_almost_empty[DATA_SIZE-1:0]),
			   // Inputs
			   .fifo_full_cond	(fifo_full_cond),
			   .fifo_empty_cond	(fifo_empty_cond),
			   .buffer_out_cond	(buffer_out_cond[DATA_SIZE-1:0]),
			   .fifo_full_estruct	(fifo_full_estruct),
			   .fifo_empty_estruct	(fifo_empty_estruct),
			   .buffer_out_estruct	(buffer_out_estruct[DATA_SIZE-1:0]),
			   .fifo_error_cond	(fifo_error_cond),
			   .fifo_pause_cond	(fifo_pause_cond),
			   .fifo_error_estruct	(fifo_error_estruct),
			   .fifo_pause_estruct	(fifo_pause_estruct));

endmodule

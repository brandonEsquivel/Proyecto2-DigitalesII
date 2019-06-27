`timescale 	1ns	/ 100ps		
`include "fifo.v"
`include "fifoSynth.v"
`include "probador.v"
`include "./CMOS/cmos_cells.v"
// `include "RAM_memory.v"
module testbench; // Testbench
    parameter MAIN_QUEUE_SIZE=4;
	// parameter DATA_SIZE = 6 
    
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		almost_empty;		// From cond of fifo.v, ...
    wire		almost_full;		// From cond of fifo.v, ...
    wire [MAIN_QUEUE_SIZE-1:0] buff_in;		// From probador of probador.v
    wire [MAIN_QUEUE_SIZE-1:0] buff_out;	// From cond of fifo.v, ..., Couldn't Merge
    wire		clk;			// From probador of probador.v
    wire [MAIN_QUEUE_SIZE-1:0] data_count;	// From cond of fifo.v, ..., Couldn't Merge
    wire		error_cond;		// From cond of fifo.v
    wire		error_estruct;		// From estruct of fifoSynth.v
    wire		fifo_empty;		// From cond of fifo.v, ...
    wire		fifo_full;		// From cond of fifo.v, ...
    wire		read;			// From probador of probador.v
    wire		reset_L;		// From probador of probador.v
    wire [MAIN_QUEUE_SIZE-1:0] umb_almost_empty;// From probador of probador.v
    wire [MAIN_QUEUE_SIZE-1:0] umb_almost_full;	// From probador of probador.v
    wire		write;			// From probador of probador.v
    // End of automatics
	    
	/*AUTOREGINPUT*/
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	reg		almost_empty_cond;	// To probador of probador.v
	reg		almost_empty_estruct;	// To probador of probador.v
	reg		almost_full_cond;	// To probador of probador.v
	reg		almost_full_estruct;	// To probador of probador.v
	reg [MAIN_QUEUE_SIZE-1:0] buff_out_cond;// To probador of probador.v
	reg [MAIN_QUEUE_SIZE-1:0] buff_out_estruct;// To probador of probador.v
	reg [MAIN_QUEUE_SIZE-1:0] data_count_cond;// To probador of probador.v
	reg [MAIN_QUEUE_SIZE-1:0] data_count_estruct;// To probador of probador.v
	reg		fifo_empty_cond;	// To probador of probador.v
	reg		fifo_empty_estruct;	// To probador of probador.v
	reg		fifo_full_cond;		// To probador of probador.v
	reg		fifo_full_estruct;	// To probador of probador.v
	// End of automatics
	fifo cond(/*AUTOINST*/
		  // Outputs
		  .almost_full		(almost_full),
		  .almost_empty		(almost_empty),
		  .fifo_full		(fifo_full),
		  .fifo_empty		(fifo_empty),
		  .data_count		(data_count[MAIN_QUEUE_SIZE-1:0]),
		  .buff_out		(buff_out[MAIN_QUEUE_SIZE-1:0]),
		  .error_cond		(error_cond),
		  // Inputs
		  .clk			(clk),
		  .reset_L		(reset_L),
		  .read			(read),
		  .write		(write),
		  .buff_in		(buff_in[MAIN_QUEUE_SIZE-1:0]),
		  .umb_almost_full	(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
		  .umb_almost_empty	(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]));
	fifoSynth estruct(/*AUTOINST*/
			  // Outputs
			  .almost_empty		(almost_empty),
			  .almost_full		(almost_full),
			  .buff_out		(buff_out[3:0]),
			  .data_count		(data_count[3:0]),
			  .error_estruct	(error_estruct),
			  .fifo_empty		(fifo_empty),
			  .fifo_full		(fifo_full),
			  // Inputs
			  .buff_in		(buff_in[3:0]),
			  .clk			(clk),
			  .read			(read),
			  .reset_L		(reset_L),
			  .umb_almost_empty	(umb_almost_empty[3:0]),
			  .umb_almost_full	(umb_almost_full[3:0]),
			  .write		(write));
	probador probador (/*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .read		(read),
			   .write		(write),
			   .buff_in		(buff_in[MAIN_QUEUE_SIZE-1:0]),
			   .umb_almost_full	(umb_almost_full[MAIN_QUEUE_SIZE-1:0]),
			   .umb_almost_empty	(umb_almost_empty[MAIN_QUEUE_SIZE-1:0]),
			   // Inputs
			   .almost_full_cond	(almost_full_cond),
			   .almost_empty_cond	(almost_empty_cond),
			   .fifo_full_cond	(fifo_full_cond),
			   .fifo_empty_cond	(fifo_empty_cond),
			   .data_count_cond	(data_count_cond[MAIN_QUEUE_SIZE-1:0]),
			   .buff_out_cond	(buff_out_cond[MAIN_QUEUE_SIZE-1:0]),
			   .almost_full_estruct	(almost_full_estruct),
			   .almost_empty_estruct(almost_empty_estruct),
			   .fifo_full_estruct	(fifo_full_estruct),
			   .fifo_empty_estruct	(fifo_empty_estruct),
			   .data_count_estruct	(data_count_estruct[MAIN_QUEUE_SIZE-1:0]),
			   .buff_out_estruct	(buff_out_estruct[MAIN_QUEUE_SIZE-1:0]),
			   .error_cond		(error_cond),
			   .error_estruct	(error_estruct));

endmodule

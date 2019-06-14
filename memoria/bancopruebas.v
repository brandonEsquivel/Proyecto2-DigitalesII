`timescale 1ns/1ps

`include "RAM_memory.v"
`include "RAM_memory_Synth.v"
`include "probador.v"

module bancopruebas;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador.v
	wire [MAIN_QUEUE_SIZE-1:0] data_in;	// From probador of probador.v
	wire [MAIN_QUEUE_SIZE-1:0] data_out;	// From conduc of RAM_memory.v
	wire [DATA_SIZE-1:0] rd_ptr;		// From probador of probador.v
	wire		read;			// From probador of probador.v
	wire		reset_L;		// From probador of probador.v
	wire [DATA_SIZE-1:0] wr_ptr;		// From probador of probador.v
	wire		write;			// From probador of probador.v
	// End of automatics
	/*AUTOREGINPUT*/
    // End of automatics
    RAM_memory conduc(/*AUTOINST*/
		      // Outputs
		      .data_out		(data_out[MAIN_QUEUE_SIZE-1:0]),
		      // Inputs
		      .clk		(clk),
		      .read		(read),
		      .write		(write),
		      .reset_L		(reset_L),
		      .data_in		(data_in[MAIN_QUEUE_SIZE-1:0]),
		      .wr_ptr		(wr_ptr[DATA_SIZE-1:0]),
		      .rd_ptr		(rd_ptr[DATA_SIZE-1:0]));

  //  RAM_memorySynth estruct(/*AUTOINST*/);

    probador probador(/*AUTOINST*/
		      // Outputs
		      .clk		(clk),
		      .read		(read),
		      .write		(write),
		      .reset_L		(reset_L),
		      .wr_ptr		(wr_ptr[DATA_SIZE-1:0]),
		      .rd_ptr		(rd_ptr[DATA_SIZE-1:0]),
		      .data_in		(data_in[MAIN_QUEUE_SIZE-1:0]),
		      // Inputs
		      .data_out		(data_out[MAIN_QUEUE_SIZE-1:0]));
     
endmodule

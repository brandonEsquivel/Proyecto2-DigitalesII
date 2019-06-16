`timescale 1ns/1ps

`include "RAM_memory.v"
`include "RAM_memory_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"


module testbench;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador.v
	wire [3:0] data_in;	// From probador of probador.v
	//wire [3:0] data_out;	// From conduc of RAM_memory.v, ..., Couldn't Merge
	wire [5:0] rd_ptr;		// From probador of probador.v
	wire		read;			// From probador of probador.v
	wire		reset_L;		// From probador of probador.v
	wire [5:0] wr_ptr;		// From probador of probador.v
	wire		write;			// From probador of probador.v
	// End of automatics
	/*AUTOREGINPUT*/
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	wire [3:0] data_out_cond;// To probador of probador.v
	wire [3:0] data_out_estruct;// To probador of probador.v
	// End of automatics
    // End of automatics
    RAM_memory conduc(/*AUTOINST*/
		      // Outputs
		      .data_out		(data_out_cond[3:0]),
		      // Inputs
		      .clk		(clk),
		      .read		(read),
		      .write		(write),
		      .reset_L		(reset_L),
		      .data_in		(data_in[3:0]),
		      .wr_ptr		(wr_ptr[5:0]),
		      .rd_ptr		(rd_ptr[5:0]));

    RAM_memory_Synth estruct(/*AUTOINST*/
			     // Outputs
			     .data_out		(data_out_estruct[3:0]),
			     // Inputs
			     .clk		(clk),
			     .data_in		(data_in[3:0]),
			     .rd_ptr		(rd_ptr[5:0]),
			     .read		(read),
			     .reset_L		(reset_L),
			     .wr_ptr		(wr_ptr[5:0]),
			     .write		(write));

    probador probador(/*AUTOINST*/
		      // Outputs
		      .clk		(clk),
		      .read		(read),
		      .write		(write),
		      .reset_L		(reset_L),
		      .wr_ptr		(wr_ptr[5:0]),
		      .rd_ptr		(rd_ptr[5:0]),
		      .data_in		(data_in[3:0]),
		      // Inputs
		      .data_out_cond	(data_out_cond[3:0]),
		      .data_out_estruct	(data_out_estruct[3:0]));
     
endmodule

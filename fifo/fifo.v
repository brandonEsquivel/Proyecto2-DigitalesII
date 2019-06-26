`timescale 1ns/1ps

`include "RAM_memory.v"

module fifo#(
    //Parametros
    parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
    parameter DATA_SIZE = 6             //cantidad de bits de entrada 
)(
    input                               clk,
    input                               reset_L,
    input                               read,
    input                               write,
    input       [MAIN_QUEUE_SIZE-1:0]   buff_in,            //datos para hacerle push
    input       [MAIN_QUEUE_SIZE-1:0]         umb_almost_full,    //umbral almost 
    input       [MAIN_QUEUE_SIZE-1:0]         umb_almost_empty,
    
    //Estados del FIFO
    output reg                          almost_full,
    output reg                          almost_empty,
    output reg                          fifo_full,
    output reg                          fifo_empty, 
    
    output reg  [MAIN_QUEUE_SIZE-1:0]   data_count,         //numero de datos
    output reg  [MAIN_QUEUE_SIZE-1:0]   buff_out            //datos para hacerle pop
);
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [MAIN_QUEUE_SIZE-1:0] data_out;		// From mem0 of RAM_memory.v
  // End of automatics
  
    /*AUTOREGINPUT*/  
    // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
    reg [MAIN_QUEUE_SIZE-1:0] data_in;		// To mem0 of RAM_memory.v
    reg [DATA_SIZE-1:0]	rd_ptr;			// To mem0 of RAM_memory.v
    reg [DATA_SIZE-1:0]	wr_ptr;			// To mem0 of RAM_memory.v
    // End of automatics
   
    RAM_memory mem0(/*AUTOINST*/
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


    always@( data_count ) begin
    if (!reset_L) begin
        fifo_empty = 0;
        fifo_full=0;
        almost_full = 0;
        almost_empty = 0;
    end 
    
    else begin
        if (data_count == 0)begin
            fifo_empty = 1;
            // fifo_full=0;
            // almost_full = 0;
            // almost_empty = 0;
        end

        if(data_count == (1<<DATA_SIZE)-1)begin            //Es decir 2**(DATA_SIZE-1)
            fifo_full = 1;
            // fifo_empty = 0;
            // almost_full = 0;
            // almost_empty = 0;
        end

        if( data_count == ( (1<<DATA_SIZE) - umb_almost_full) )begin
            almost_full = 1;
            // almost_empty =0;
            // fifo_full=0;
            // fifo_empty=0;
        end

        if(data_count == umb_almost_empty)begin
            almost_empty = 1;
            // almost_full =0;
            // fifo_full=0;
            // fifo_empty=0;
        end
    end

    end

    always@( posedge clk or posedge reset_L )begin
        if ( reset_L ) begin
            data_count  <= 'b0;
            buff_out    <= 'b0;
            wr_ptr      <= 'b0;
            rd_ptr      <= 'b0;
            // fifo_empty <='b0;
            // fifo_full <='b0;
            // almost_full <= 'b0;
            // almost_empty <= 'b0;

        end else begin
            if( !fifo_full && write )begin
                //wr_ptr incrementa
                wr_ptr <= wr_ptr + 1;
                
                if ( !fifo_empty && read )begin
                    rd_ptr <= rd_ptr + 1;               //rd_ptr incrementa
                    data_count <= data_count;
                end else begin
                    rd_ptr <= rd_ptr;
                    data_count <= data_count + 1;
                end
            end else if( !fifo_empty && read ) begin
                rd_ptr <= rd_ptr + 1;                   //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo

                data_count  <= data_count - 1;
                buff_out    <= data_out; 
            end else begin
                rd_ptr <= rd_ptr;               //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                
                data_count  <= data_count;
                buff_out    <= buff_out;
            end
        end
    end

    always@(posedge clk)begin
        if( write && !buff_out ) begin
            data_in<= buff_in;
        end else begin
            data_in <= data_in;
        end
    end
endmodule

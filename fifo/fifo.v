`timescale 1ns/1ps

`include "RAM_memory.v"

module fifo#(
    //Parametros
    parameter DATA_SIZE = 6,               //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 3        //Cantiad de filas del main fifo    
)(
    input                               clk,
    input                               reset_L,
    input                               read,
    input                               write,
    input       [DATA_SIZE-1:0]         buff_in,            //datos para hacerle push
    input       [DATA_SIZE-1:0]         umb_almost_full,    //umbral almost 
    input       [DATA_SIZE-1:0]         umb_almost_empty,
    output reg                          fifo_empty_cond, 
    output reg [DATA_SIZE-1:0]         buffer_out_cond,            //datos para hacerle pop
    output reg                          fifo_error_cond,
    output reg                          fifo_pause_cond
);
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [DATA_SIZE-1:0] data_out;		// From mem0 of RAM_memory.v
  // End of automatics
    reg fifo_full_cond;
    reg almost_full, almost_empty;
    reg [DATA_SIZE-1:0]data_count;  
  
  /*AUTOREGINPUT*/  
    // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
    
    
    // wire [DATA_SIZE-1:0] buff_in;		// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	rd_ptr;			// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	wr_ptr;			// To mem0 of RAM_memory.v
    reg datamod;
    
    // End of automatics

    reg [DATA_SIZE-1:0] data_to_mem;
   
    RAM_memory mem0(/*AUTOINST*/
		    // Outputs
		    .data_out		(data_out[DATA_SIZE-1:0]),
		    // Inputs
		    .clk		(clk),
		    .read		(read),
		    .write		(write),
		    .reset_L		(reset_L),
		    .data_in		(buff_in),
		    .wr_ptr		(wr_ptr[MAIN_QUEUE_SIZE-1:0]),
		    .rd_ptr		(rd_ptr[MAIN_QUEUE_SIZE-1:0]));


    always@(*) begin
        fifo_empty_cond = 0;
        fifo_full_cond = 0;
        almost_full = 0;
        almost_empty = 0;
        datamod = 0;
        fifo_error_cond = 0;
        fifo_pause_cond=0;
        if ( ~reset_L ) begin
            fifo_empty_cond = 1;
            fifo_full_cond = 0;
            almost_full = 0;
            almost_empty = 0;
            fifo_pause_cond=0;
            fifo_error_cond=0;
        end 
        
        //control de estados del fifo
 
        
        else begin
            if ( data_count == 0 )begin
                fifo_empty_cond = 1;
                fifo_pause_cond=0;
            end

            if( data_count ==( (2**MAIN_QUEUE_SIZE)) )begin            //Es decir 2**(DATA_SIZE-1)
                fifo_full_cond = 1;
                // fifo_pause_cond=1;
            end

            if( data_count >= umb_almost_full )begin
                almost_full = 1;
                fifo_pause_cond=1;
            end

            if( (data_count <= umb_almost_empty)&&(data_count!=0) )begin
                almost_empty = 1;
                fifo_pause_cond=0;
            end
            
            if( write && fifo_full_cond )begin
                fifo_error_cond = 1;
            end

            if( read && fifo_empty_cond )begin
                fifo_error_cond = 1;
            end
        end

    end

    
    always@( posedge clk)begin
        if ( !reset_L ) begin
            data_count <= 'b0;
            buffer_out_cond <= 'b0;
            wr_ptr          <= 'b0;
            rd_ptr          <= 'b0;
            datamod         <= 'b0;
            // fifo_pause_cond     <= 'b0;
        end else begin
            

            if( !fifo_full_cond && write )begin
                wr_ptr <= wr_ptr + 1;                   //wr_ptr incrementa
                
                if ( !fifo_empty_cond && read )begin
                    rd_ptr <= rd_ptr + 1;               //rd_ptr incrementa
                    data_count <= data_count;
                end else begin
                    rd_ptr <= rd_ptr;
                    data_count <= data_count + 1;
                end
            end else if( !fifo_empty_cond && read ) begin
                rd_ptr <= rd_ptr + 1;                   //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                data_count  <= data_count - 1;
                buffer_out_cond    <= data_out; 
            end else begin
                rd_ptr <= rd_ptr;                       //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                
                data_count  <= data_count;
            end
        end
    end

endmodule

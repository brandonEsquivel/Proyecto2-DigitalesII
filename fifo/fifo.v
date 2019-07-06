`timescale 1ns/1ps

`include "RAM_memory.v"

module fifo#(
    //Parametros
    parameter DATA_SIZE = 4,               //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 3        //Cantiad de filas del main fifo    
)(
    input                               clk,
    input                               reset_L,
    input                               read,
    input                               push_,
    input       [DATA_SIZE-1:0]         data_in,            //datos para hacerle push
    input       [DATA_SIZE-1:0]         af,    //umbral almost 
    input       [DATA_SIZE-1:0]         ae,
    
    //Estados del FIFO
//  output reg                          almost_full_,
//  output reg                          almost_empty_,
    output reg                          fifo_full_,
    output reg                          fifo_empty_, 
    
//  output reg  [DATA_SIZE-1:0]         data_count_,           //numero de datos
    output reg  [DATA_SIZE-1:0]         data_out_,            //datos para hacerle pop
    output reg                          fifo_error_,
    output reg                          fifo_pause_
);
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [DATA_SIZE-1:0] data_out;		// From mem0 of RAM_memory.v
  // End of automatics
  
    reg almost_full_, almost_empty_;
    reg [DATA_SIZE-1:0]data_count_;  
  
  /*AUTOREGINPUT*/  
    // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
    
    
    // wire [DATA_SIZE-1:0] data_in;		// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	rd_ptr;			// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	wr_ptr;			// To mem0 of RAM_memory.v
    reg datamod,i_write;
    
    // End of automatics

    reg [DATA_SIZE-1:0] data_to_mem;
   
    RAM_memory mem0(/*AUTOINST*/
		    // Outputs
		    .data_out		(data_out[DATA_SIZE-1:0]),
		    // Inputs
		    .clk		(clk),
		    .read		(read),
		    .write		(push_),
		    .reset_L		(reset_L),
		    .data_in		(data_in),
		    .wr_ptr		(wr_ptr[MAIN_QUEUE_SIZE-1:0]),
		    .rd_ptr		(rd_ptr[MAIN_QUEUE_SIZE-1:0]));


    always@(*) begin
        fifo_empty_ = 0;
        fifo_full_ = 0;
        almost_full_ = 0;
        almost_empty_ = 0;
        datamod = 0;
        fifo_error_ = 0;
        if ( ~reset_L ) begin
            fifo_empty_ = 1;
            fifo_full_ = 0;
            almost_full_ = 0;
            almost_empty_ = 0;
        end 
        
        //control de estados del fifo
 
        
        else begin
            if ( data_count_ == 0 )begin
                fifo_empty_ = 1;
            end

            if( data_count_ ==( (2**DATA_SIZE)-1) )begin            //Es decir 2**(DATA_SIZE-1)
                fifo_full_ = 1;
            end

            if( data_count_ >= af )begin
                almost_full_ = 1;
            end

            if( (data_count_ <= ae)&&(data_count_!=0) )begin
                almost_empty_ = 1;
            end
            
            if( i_write && fifo_full_ )begin
                fifo_error_ = 1;
            end

            if( read && fifo_empty_ )begin
                fifo_error_ = 1;
            end
        end

    end

    always@ (negedge clk)begin
        if (!reset_L)
            i_write <= 'b0;
        else
            i_write <= push_;
    end

    always@( posedge clk)begin
        if ( !reset_L ) begin
            data_count_ <= 'b0;
            data_out_ <= 'b0;
            wr_ptr          <= 'b0;
            rd_ptr          <= 'b0;
            datamod         <= 'b0;
            fifo_pause_     <= 'b0;
        end else begin
            if(almost_full_ && !almost_empty_)
                fifo_pause_ <= 1;
            else if (!almost_full_ && almost_empty_)
                fifo_pause_ <= 'b0;


            if( !fifo_full_ && i_write )begin
                wr_ptr <= wr_ptr + 1;                   //wr_ptr incrementa
                
                if ( !fifo_empty_ && read )begin
                    rd_ptr <= rd_ptr + 1;               //rd_ptr incrementa
                    data_count_ <= data_count_;
                end else begin
                    rd_ptr <= rd_ptr;
                    data_count_ <= data_count_ + 1;
                end
            end else if( !fifo_empty_ && read ) begin
                rd_ptr <= rd_ptr + 1;                   //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                data_count_  <= data_count_ - 1;
                data_out_    <= data_out; 
            end else begin
                rd_ptr <= rd_ptr;                       //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                
                data_count_  <= data_count_;
                // data_out_    <= data_out_;
            end
        end
    end

endmodule

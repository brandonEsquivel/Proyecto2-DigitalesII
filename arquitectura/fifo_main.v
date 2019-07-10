`timescale 1ns/1ps



module fifo_main#(
    //Parametros
    parameter DATA_SIZE = 6,               //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 2        //Cantiad de filas del main fifo    
)(
    input                               clk,
    input                               reset_L,
    input                               pop_main,
    input                               push_main,
    input       [DATA_SIZE-1:0]         data_in,            //datos para hacerle push
    input       [DATA_SIZE-1:0]         afMF_o,               //umbral almost full main buffer
    input       [DATA_SIZE-1:0]         aeMF_o,               // umbral almost empty main buffer
    
    //Estados del FIFO
    //output reg                          fifo_full,
    output reg                          fifo_empty_main, 
    
//  output reg  [DATA_SIZE-1:0]         data_count,           //numero de datos
    output reg [DATA_SIZE-1:0]          data_demux_vc,            //datos para hacerle pop
    output reg                          fifo_error_main,
    output reg                          fifo_pause_main
);
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [DATA_SIZE-1:0] data_out;		// From mem0 of RAM_memory.v
  // End of automatics
    reg fifo_full;  
    reg almost_full, almost_empty;
    reg [DATA_SIZE-1:0]data_count;  
  
  /*AUTOREGINPUT*/  
    // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
    
    
    // wire [DATA_SIZE-1:0] data_in;		// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	rd_ptr;			// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	wr_ptr;			// To mem0 of RAM_memory.v
    reg datamod;
    
    // End of automatics

    reg [DATA_SIZE-1:0] data_to_mem;
   
    RAM_memory #(DATA_SIZE,MAIN_QUEUE_SIZE) main_mem(/*AUTOINST*/
		    // Outputs
		    .data_out		(data_out[DATA_SIZE-1:0]),
		    // Inputs
		    .clk		(clk),
		    .read		(pop_main),
		    .write		(push_main),
		    .reset_L		(reset_L),
		    .data_in		(data_in),
		    .wr_ptr		(wr_ptr[MAIN_QUEUE_SIZE-1:0]),
		    .rd_ptr		(rd_ptr[MAIN_QUEUE_SIZE-1:0]));


    always@(*) begin
        fifo_empty_main = 0;
        fifo_full = 0;
        almost_full = 0;
        almost_empty = 0;
        datamod = 0;
        fifo_error_main = 0;
        fifo_pause_main=0;
        if ( ~reset_L ) begin
            fifo_empty_main = 1;
            fifo_full = 0;
            almost_full = 0;
            almost_empty = 0;
            fifo_pause_main=0;
            fifo_error_main=0;
        end 
        
        //control de estados del fifo
 
        
        else begin
            if ( data_count == 0 )begin
                fifo_empty_main = 1;
                fifo_pause_main=0;
            end

            if( data_count ==( (2**MAIN_QUEUE_SIZE)) )begin            //Es decir 2**(DATA_SIZE-1)
                fifo_full = 1;
                // fifo_pause_main=1;
            end

            if( data_count >= afMF_o )begin
                almost_full = 1;
                fifo_pause_main=1;
            end

            if( (data_count <= aeMF_o)&&(data_count!=0) )begin
                almost_empty = 1;
                fifo_pause_main=0;
            end
            
            if( push_main && fifo_full )begin
                fifo_error_main = 1;
            end

            if( pop_main && fifo_empty_main )begin
                fifo_error_main = 1;
            end
        end

    end

    
    always@( posedge clk)begin
        if ( !reset_L ) begin
            data_count <= 'b0;
            data_demux_vc <= 'b0;
            wr_ptr          <= 'b0;
            rd_ptr          <= 'b0;
            datamod         <= 'b0;
            // fifo_pause_main     <= 'b0;
        end else begin
            

            if( !fifo_full && push_main )begin
                wr_ptr <= wr_ptr + 1;                   //wr_ptr incrementa
                
                if ( !fifo_empty_main && pop_main )begin
                    rd_ptr <= rd_ptr + 1;               //rd_ptr incrementa
                    data_count <= data_count;
                end else begin
                    rd_ptr <= rd_ptr;
                    data_count <= data_count + 1;
                end
            end else if( !fifo_empty_main && pop_main ) begin
                rd_ptr <= rd_ptr + 1;                   //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                data_count  <= data_count - 1;
                data_demux_vc    <= data_out; 
            end else begin
                rd_ptr <= rd_ptr;                       //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                
                data_count  <= data_count;
            end
        end
    end

endmodule

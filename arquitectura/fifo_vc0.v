`timescale 1ns/1ps



module fifo_vc0#(
    //Parametros
    parameter DATA_SIZE = 6,               //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 4        //Cantidad de filas del vc0 fifo    
)(
    input                               clk,
    input                               reset_L,
    input                               pop_vc0,
    input                               push_vc0,
    input       [DATA_SIZE-1:0]         data_vc0,            //datos para hacerle push
    input       [3:0]         afVC_o,               //umbral almost full vc0 buffer
    input       [3:0]         aeVC_o,               // umbral almost empty vc0 buffer
    
    //Estados del FIFO
    //output reg                          fifo_full,
    output reg                          fifo_empty_vc0, 
    
//  output reg  [DATA_SIZE-1:0]         data_count,           //numero de datos
    output [DATA_SIZE-1:0]          data_mux_0,            //datos para hacerle pop
    output reg                          fifo_error_vc0,
    output reg                          fifo_pause_vc0
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
    
    
    // wire [DATA_SIZE-1:0] data_vc0;		// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	rd_ptr;			// To mem0 of RAM_memory.v
    reg [MAIN_QUEUE_SIZE-1:0]	wr_ptr;			// To mem0 of RAM_memory.v
    reg datamod;
    
    // End of automatics

    reg [DATA_SIZE-1:0] data_to_mem;
   
    RAM_memory #(DATA_SIZE,MAIN_QUEUE_SIZE) mem_vc0(/*AUTOINST*/
		    // Outputs
		    .data_out		(data_mux_0[DATA_SIZE-1:0]),
		    // Inputs
		    .clk		(clk),
		    .read		(pop_vc0),
		    .write		(push_vc0),
		    .reset_L		(reset_L),
		    .data_in		(data_vc0),
		    .wr_ptr		(wr_ptr[MAIN_QUEUE_SIZE-1:0]),
		    .rd_ptr		(rd_ptr[MAIN_QUEUE_SIZE-1:0]));


    always@(*) begin
        fifo_empty_vc0 = 0;
        fifo_full = 0;
        almost_full = 0;
        almost_empty = 0;
        datamod = 0;
        fifo_error_vc0 = 0;
        fifo_pause_vc0=0;
        if ( ~reset_L ) begin
            fifo_empty_vc0 = 1;
            fifo_full = 0;
            almost_full = 0;
            almost_empty = 0;
            fifo_pause_vc0=0;
            fifo_error_vc0=0;
        end 
        
        //control de estados del fifo
 
        
        else begin
            if ( data_count == 0 )begin
                fifo_empty_vc0 = 1;
                fifo_pause_vc0=0;
            end

            if( data_count ==( (2**MAIN_QUEUE_SIZE)) )begin            //Es decir 2**(DATA_SIZE-1)
                fifo_full = 1;
                // fifo_pause_vc0=1;
            end

            if( data_count >= afVC_o )begin
                almost_full = 1;
                fifo_pause_vc0=1;
            end

            if( (data_count <= aeVC_o)&&(data_count!=0) )begin
                almost_empty = 1;
                fifo_pause_vc0=0;
            end
            
            if( push_vc0 && fifo_full )begin
                fifo_error_vc0 = 1;
            end

            if( pop_vc0 && fifo_empty_vc0 )begin
                fifo_error_vc0 = 1;
            end
        end

    end

    
    always@( posedge clk)begin
        if ( !reset_L ) begin
            data_count <= 'b0;
            // data_mux_0 <= 'b0;
            wr_ptr          <= 'b0;
            rd_ptr          <= 'b0;
            datamod         <= 'b0;
            // fifo_pause_vc0     <= 'b0;
        end else begin
            

            if( !fifo_full && push_vc0 )begin
                wr_ptr <= wr_ptr + 1;                   //wr_ptr incrementa
                
                if ( !fifo_empty_vc0 && pop_vc0 )begin
                    rd_ptr <= rd_ptr + 1;               //rd_ptr incrementa
                    data_count <= data_count;
                end else begin
                    rd_ptr <= rd_ptr;
                    data_count <= data_count + 1;
                end
            end else if( !fifo_empty_vc0 && pop_vc0 ) begin
                rd_ptr <= rd_ptr + 1;                   //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                data_count  <= data_count - 1;
                // data_mux_0    <= data_out; 
            end else begin
                rd_ptr <= rd_ptr;                       //rd_ptr incrementa
                wr_ptr <= wr_ptr;                       //wr_ptr es el mismo
                
                data_count  <= data_count;
            end
        end
    end

endmodule

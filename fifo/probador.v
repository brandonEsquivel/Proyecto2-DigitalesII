module probador #(
    //Parametros
    parameter DATA_SIZE = 4             //cantidad de bits de entrada 
  //  parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
)(
    input                           almost_full_cond,
    input                           almost_empty_cond,
    input                           fifo_full_cond,
    input                           fifo_empty_cond, 
    input  [DATA_SIZE-1:0]         data_count_cond,         //numero de datos
    input  [DATA_SIZE-1:0]         buffer_out_cond,            //datos para hacerle pop
    input                           almost_full_estruct,
    input                           almost_empty_estruct,
    input                           fifo_full_estruct,
    input                           fifo_empty_estruct, 
    input  [DATA_SIZE-1:0]         data_count_estruct,         //numero de datos
    input  [DATA_SIZE-1:0]         buffer_out_estruct,            //datos para hacerle pop
    input error_cond,
    input error_estruct,
    
    output reg                              clk,
    output reg                              reset_L,
    output reg                              read,
    output reg                              write,
    output reg       [DATA_SIZE-1:0]       buff_in,            //datos para hacerle push
    output reg       [DATA_SIZE-1:0]       umb_almost_full,    //umbral almost 
    output reg       [DATA_SIZE-1:0]       umb_almost_empty
);
 

 initial begin

    $dumpfile("bancopruebas.vcd");        //Dumpfile to make in current folder
    $dumpvars;
    write<='b0;
    read<='b0;
    buff_in<='b0;
    umb_almost_empty= 'h3;
    umb_almost_full='h6;

    reset_L <= 	'b0;                    //a relojes se resetean            
    read    <=  'b0;
    write   <=  'b0;

    //prueba de escritura
    #4;
    @(posedge clk)
    reset_L <= 	'b1;
    buff_in <= 'h3;
    
    repeat(8)begin
        @(posedge clk)
        buff_in<=buff_in+1;
    end

    @(posedge clk)
    write <= 1;     
    buff_in<=buff_in+1;

    @(posedge clk)
    buff_in<=buff_in+1;
    repeat(6)begin
        @(posedge clk)
        write <= 1;     
        buff_in <= buff_in + 1;
        
    end
    
    @(posedge clk)
        write<=0;
        read <= 1;
        

    repeat(8)begin
        @(posedge clk)
        //mandar direcciones random a wr_ptr
        read<=1;
    end
        
    @(posedge clk)
        write<=0;
        read <= 0;

    repeat(8)begin
        @(posedge clk)
        read<=1;
        //mandar direcciones random a wr_ptr
    end
    @(posedge clk)
    read<='b1;
    write <= 0;
    buff_in<='h4;

    $finish;
end
    initial clk <= 0;
    always # 2 clk <= ~clk;       //genera señal 4 ns 

endmodule

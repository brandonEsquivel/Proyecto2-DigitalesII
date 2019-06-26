module probador #(
    //Parametros
    parameter MAIN_QUEUE_SIZE=4,        //Cantiad de filas del main fifo    
    parameter DATA_SIZE = 6             //cantidad de bits de entrada 
)(
    input                          almost_full_cond,
    input                          almost_empty_cond,
    input                          fifo_full_cond,
    input                          fifo_empty_cond, 
    input  [MAIN_QUEUE_SIZE-1:0]   data_count_cond,         //numero de datos
    input  [MAIN_QUEUE_SIZE-1:0]   buff_out_cond,            //datos para hacerle pop
    input                          almost_full_estruct,
    input                          almost_empty_estruct,
    input                          fifo_full_estruct,
    input                          fifo_empty_estruct, 
    input  [MAIN_QUEUE_SIZE-1:0]   data_count_estruct,         //numero de datos
    input  [MAIN_QUEUE_SIZE-1:0]   buff_out_estruct,            //datos para hacerle pop
    
    output reg                               clk,
    output reg                               reset_L,
    output reg                               read,
    output reg                               write,
    output reg       [MAIN_QUEUE_SIZE-1:0]   buff_in,            //datos para hacerle push
    output reg       [MAIN_QUEUE_SIZE-1:0]         umb_almost_full,    //umbral almost 
    output reg       [MAIN_QUEUE_SIZE-1:0]         umb_almost_empty
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
    @(posedge clk)
    write <= 1;     
    buff_in <= 'h3;
    
    repeat(10)begin
        @(posedge clk)
        write <= 1;     
        buff_in <= buff_in + 1;
        
    end
    
    @(posedge clk)
        write<=0;
        read <= 1;

    repeat(30)begin
        @(posedge clk)
        //mandar direcciones random a wr_ptr
        read<=1;
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
module probador(
   input [4:0]error_out_cond,
   input active_out_cond,
   input idle_out_cond,
   input [1:0] afMF_o_cond,
   input [1:0] aeMF_o_cond,
   input [1:0] afD_o_cond,
   input [1:0] aeD_o_cond,
   input [3:0] afVC_o_cond,
   input [3:0] aeVC_o_cond,

   input [4:0]error_out_estruct,
   input active_out_estruct,
   input idle_out_estruct,
   input [1:0] afMF_o_estruct,
   input [1:0] aeMF_o_estruct,
   input [1:0] afD_o_estruct,
   input [1:0] aeD_o_estruct,
   input [3:0] afVC_o_estruct,
   input [3:0] aeVC_o_estruct,

   output reg clk,
   output reg reset_L,
   output reg init,
   output reg [4:0] FIFO_errors,
   output reg [4:0]FIFO_empties,
   output reg [1:0] afMF_i,
   output reg [1:0] aeMF_i,
   output reg [3:0] afVCs_i,
   output reg [3:0] aeVCs_i,
   output reg [1:0] afDs_i,
   output reg [1:0] aeDs_i
   );

reg [4:0]errors_cond,errors_estruct;
reg active_cond,active_estruct,idle_cond,idle_estruct;
reg igualdad;
   initial begin
      $dumpfile("bancopruebas.vcd");
      $dumpvars;
      
      reset_L<='b0;
      init<='b0;
      afMF_i<='b00;
      aeMF_i<='b00;
      afVCs_i<='b110;
      aeVCs_i<='b011;
      afDs_i<='b110;
      aeDs_i<='b011;
      FIFO_empties<='b11111;
      FIFO_errors<='b0;

      @(posedge clk);
      reset_L<='b1;
      
      @(posedge clk);
      init<='b1;
      @(posedge clk);
      init<='b0;
      repeat (2) begin
      @(posedge clk);
         FIFO_empties<='b00001;
      end

      @(posedge clk);
         FIFO_empties<='b11111;

      // @(posedge clk);
      //    init<='b1;

      // @(posedge clk);
      //    init<='b0;
      
      @(posedge clk);

      @(posedge clk);
      FIFO_errors<='b10001;

      @(posedge clk);
      FIFO_errors<='b0;
      reset_L<='b0;
      // afMF_i<='b01;
      // aeMF_i<='b01;
      // afVCs_i<='b111;
      // aeVCs_i<='b001;
      // afDs_i<='b111;
      // aeDs_i<='b001;

      @(posedge clk);
      reset_L<='b1;
      
      @(posedge clk);
      init<='b1;
      afMF_i<='b10;
      aeMF_i<='b01;
      afVCs_i<='b111;
      aeVCs_i<='b001;
      afDs_i<='b111;
      aeDs_i<='b001;

      @(posedge clk);
      init<='b0;

      
      @(posedge clk);
         FIFO_empties<='b00001;
      @(posedge clk);
      
      @(posedge clk);
      FIFO_errors<='b11111;
      $finish;
   end

   initial clk <=0;
   always #2 clk <=~clk;
   // always @(posedge clk) begin
   //    errors_cond<=error_out_cond;
   //    errors_estruct<=error_out_estruct;
   //    idle_cond<=idle_out_cond;
   //    idle_estruct<=idle_out_estruct;
   //    active_cond<=active_out_cond;
   //    active_estruct<=active_out_estruct;
      
   //    if (reset_L) begin
   //       if( (errors_cond==errors_estruct)&(idle_cond==idle_estruct)&(active_cond==active_estruct))begin
   //          $display("Las descripciones son iguales en salida");   
   //          igualdad<='b1;
   //       end 
   //       else begin
   //          $display("Las descripciones NO son iguales en salida");   
   //          igualdad<='b0;
   //       end
   //    end
   // end
endmodule // probador

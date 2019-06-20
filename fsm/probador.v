module probador(
   input [4:0]error_out_cond,
   input active_out_cond,
   input idle_out_cond,
   input [4:0]error_out_estruct,
   input active_out_estruct,
   input idle_out_estruct,
   output reg clk,
   output reg reset_L,
   output reg init,
   output reg [4:0] FIFO_errors,
   output reg [4:0]FIFO_empties,
   output reg [2:0] afMFs,
   output reg [2:0] aeMFs,
   output reg [2:0] afVCs,
   output reg [2:0] aeVCs,
   output reg [2:0] afDs,
   output reg [2:0] aeDs
   );

reg [4:0]errors_cond,errors_estruct;
reg active_cond,active_estruct,idle_cond,idle_estruct;
reg igualdad;
   initial begin
      $dumpfile("bancopruebas.vcd");
      $dumpvars;
      
      reset_L<='b0;
      init<='b0;
      afMFs<='b110;
      aeMFs<='b011;
      afVCs<='b110;
      aeVCs<='b011;
      afDs<='b110;
      aeDs<='b011;
      FIFO_empties<='b0;
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

      repeat (2) begin
      @(posedge clk);
         FIFO_empties<='b00000;
      end
      
      @(posedge clk);
      FIFO_errors<='b10001;

      @(posedge clk);
      FIFO_errors<='b0;
      reset_L<='b0;
      afMFs<='b111;
      aeMFs<='b001;
      afVCs<='b111;
      aeVCs<='b001;
      afDs<='b111;
      aeDs<='b001;

      @(posedge clk);
      reset_L<='b1;
      
      @(posedge clk);
      init<='b1;
      @(posedge clk);
      init<='b0;
      
      @(posedge clk);
         FIFO_empties<='b00001;
      
      @(posedge clk);
      FIFO_errors<='b11111;
      $finish;
   end

   initial clk <=0;
   always #2 clk <=~clk;
   always @(posedge clk) begin
      errors_cond<=error_out_cond;
      errors_estruct<=error_out_estruct;
      idle_cond<=idle_out_cond;
      idle_estruct<=idle_out_estruct;
      active_cond<=active_out_cond;
      active_estruct<=active_out_estruct;
      
      if (reset_L) begin
         if( (errors_cond==errors_estruct)&(idle_cond==idle_estruct)&(active_cond==active_estruct))begin
            $display("Las descripciones son iguales en salida");   
            igualdad<='b1;
         end 
         else begin
            $display("Las descripciones NO son iguales en salida");   
            igualdad<='b0;
         end
      end
   end
endmodule // probador

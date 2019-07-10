module fsm (
        input clk,
        input reset_L,
        input init,
        input [4:0] FIFO_errors,
        input [4:0]FIFO_empties,
        input [1:0] afMF_i,
        input [1:0] aeMF_i,
        input [3:0] afVCs_i,
        input [3:0] aeVCs_i,
        input [1:0] afDs_i,
        input [1:0] aeDs_i,
        output reg [4:0]error_out,
        output reg active_out,
        output reg idle_out,
        output reg [1:0] afMF_o,
        output reg [1:0] aeMF_o,
        output reg [1:0] afD_o,
        output reg [1:0] aeD_o,
        output reg [3:0] afVC_o,
        output reg [3:0] aeVC_o);

    //FF
    reg [4:0] estado, estado_proximo;
    reg [4:0] error_ant;
  
    //Estados
    parameter RESET='b00001;
    parameter INIT='b00010;
    parameter IDLE='b00100;
    parameter ACTIVE='b01000;
    parameter ERROR='b10000;


    always @(posedge clk)begin
      if (!reset_L) begin
        estado<=RESET;
        afMF_o<='b0;
        aeMF_o<='b0;
        afVC_o<='b0;
        aeVC_o<='b0;
        afD_o<='b0;
        aeD_o<='b0;
        error_ant<='b0;
      end else begin
        estado<=estado_proximo;
        if(estado==INIT)begin    
            afMF_o<=afMF_i;
            aeMF_o<=aeMF_i;
            afVC_o<=afVCs_i;
            aeVC_o<=aeVCs_i;
            afD_o<=afDs_i;
            aeD_o<=aeDs_i;
        end
      end
    end



    always @(*)begin
        error_out=0;
        active_out=0;
        idle_out='b0;
        estado_proximo=RESET;
        //Seleccion de proximos estados
        case (estado)
        RESET: begin
            estado_proximo=INIT;
            error_out='b0;
            active_out='b0;
            idle_out='b0;
        end

        INIT:begin
            if (init) begin
                estado_proximo=INIT;
            end else begin
                estado_proximo=IDLE;
            end
            error_out='b0;
            active_out='b0;
            idle_out='b0;

            // afMF_o=afMF_i;
            // aeMF_o=aeMF_i;
            // afVC_o=afVCs_i;
            // aeVC_o=aeVCs_i;
            // afD_o=afDs_i;
            // aeD_o=aeDs_i;
        end

        IDLE:begin
            if (FIFO_errors==0) begin
                if (init==1) begin
                    estado_proximo=INIT;
                end else begin
                    if (FIFO_empties==31) begin
                        estado_proximo=IDLE;
                    end else begin
                        estado_proximo=ACTIVE;
                    end
                end
                    error_out='b0;
                    active_out='b0;
                    idle_out='b1;
            end 
          
            else begin
                estado_proximo=ERROR;
                error_out=FIFO_errors;
                active_out='b0;
                idle_out='b1;
            end
        end

        ACTIVE:begin
            if (FIFO_errors==0) begin
                if (init==1) begin
                    estado_proximo=INIT;
                end else begin
                    if (FIFO_empties==31) begin
                        estado_proximo=IDLE;
                    end else begin
                        estado_proximo=ACTIVE;
                    end
                end
                error_out='b0;
                active_out='b1;
                idle_out='b0;
            end
          
          else begin
            estado_proximo=ERROR;
            error_ant=FIFO_errors;
            error_out=FIFO_errors;
            active_out='b0;
            idle_out='b0;
          end
        end

        ERROR:begin
            estado_proximo=ERROR;
            error_out=error_ant;
            active_out='b0;
            idle_out='b0;
        end
        default:begin
            estado_proximo=RESET;
        end
        endcase
    end
endmodule

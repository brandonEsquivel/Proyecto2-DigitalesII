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
        output reg [4:0]error_out_cond,
        output reg active_out_cond,
        output reg idle_out_cond,
        output reg [1:0] afMF_o_cond,
        output reg [1:0] aeMF_o_cond,
        output reg [1:0] afD_o_cond,
        output reg [1:0] aeD_o_cond,
        output reg [3:0] afVC_o_cond,
        output reg [3:0] aeVC_o_cond);

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
        afMF_o_cond<='b0;
        aeMF_o_cond<='b0;
        afVC_o_cond<='b0;
        aeVC_o_cond<='b0;
        afD_o_cond<='b0;
        aeD_o_cond<='b0;
        error_ant<='b0;
      end else begin
        estado<=estado_proximo;
        if(estado==INIT)begin    
            afMF_o_cond<=afMF_i;
            aeMF_o_cond<=aeMF_i;
            afVC_o_cond<=afVCs_i;
            aeVC_o_cond<=aeVCs_i;
            afD_o_cond<=afDs_i;
            aeD_o_cond<=aeDs_i;
        end
      end
    end



    always @(*)begin
        error_out_cond=0;
        active_out_cond=0;
        idle_out_cond='b0;
        estado_proximo=RESET;
        //Seleccion de proximos estados
        case (estado)
        RESET: begin
            estado_proximo=INIT;
            error_out_cond='b0;
            active_out_cond='b0;
            idle_out_cond='b0;
        end

        INIT:begin
            if (init) begin
                estado_proximo=INIT;
            end else begin
                estado_proximo=IDLE;
            end
            error_out_cond='b0;
            active_out_cond='b0;
            idle_out_cond='b0;

            // afMF_o_cond=afMF_i;
            // aeMF_o_cond=aeMF_i;
            // afVC_o_cond=afVCs_i;
            // aeVC_o_cond=aeVCs_i;
            // afD_o_cond=afDs_i;
            // aeD_o_cond=aeDs_i;
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
                    error_out_cond='b0;
                    active_out_cond='b0;
                    idle_out_cond='b1;
            end 
          
            else begin
                estado_proximo=ERROR;
                error_out_cond=FIFO_errors;
                active_out_cond='b0;
                idle_out_cond='b1;
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
                error_out_cond='b0;
                active_out_cond='b1;
                idle_out_cond='b0;
            end
          
          else begin
            estado_proximo=ERROR;
            error_ant=FIFO_errors;
            error_out_cond=FIFO_errors;
            active_out_cond='b0;
            idle_out_cond='b0;
          end
        end

        ERROR:begin
            estado_proximo=ERROR;
            error_out_cond=error_ant;
            active_out_cond='b0;
            idle_out_cond='b0;
        end
        default:begin
            estado_proximo=RESET;
        end
        endcase
    end
endmodule

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
        output reg [1:0] afMF_o,
        output reg [1:0] aeMF_o,
        output reg [1:0] iafD_o,
        output reg [1:0] iaeD_o,
        output reg [3:0] iafVC_o,
        output reg [3:0] iaeVC_o);

    //FF
    reg [4:0] estado, estado_proximo;
    // reg [2:0] afMF_o,aeMF_o,iafVC_o,iaeVC_o,iafD_o,iaeD_o;
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
        iafVC_o<='b0;
        iaeVC_o<='b0;
        iafD_o<='b0;
        iaeD_o<='b0;
        error_ant<='b0;
      end else begin
        estado<=estado_proximo;
      end
    end



    always @(*)begin
        error_out_cond='b0;
        active_out_cond='b0;
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
            afMF_o=afMF_i;
            aeMF_o=aeMF_i;
            iafVC_o=afVCs_i;
            iaeVC_o=aeVCs_i;
            iafD_o=afDs_i;
            iaeD_o=aeDs_i;
        end

        IDLE:begin
            if (FIFO_errors==0) begin
                if (init==1) begin
                    estado_proximo=INIT;
                end else begin
                    if (FIFO_empties==0) begin
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
                    if (FIFO_empties==0) begin
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

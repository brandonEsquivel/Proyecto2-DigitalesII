module fsm (
        input clk,
        input reset_L,
        input init,
        input [4:0] FIFO_errors,
        input [4:0]FIFO_empties,
        input [2:0] afMFs,
        input [2:0] aeMFs,
        input [3:0] afVCs,
        input [3:0] aeVCs,
        input [2:0] afDs,
        input [2:0] aeDs,
        output reg [4:0]error_out_cond,
        output reg active_out_cond,
        output reg idle_out_cond);

    //FF
    reg [4:0] estado, estado_proximo;
    reg [2:0] iafMF,iaeMF,iafVC,iaeVC,iafD,iaeD;
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
        iafMF<='b0;
        iaeMF<='b0;
        iafVC<='b0;
        iaeVC<='b0;
        iafD<='b0;
        iaeD<='b0;
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
            iafMF=afMFs;
            iaeMF=aeMFs;
            iafVC=afVCs;
            iaeVC=aeVCs;
            iafD=afDs;
            iaeD=aeDs;
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

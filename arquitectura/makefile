NOMBRE=bancoEv
BANCO=$(NOMBRE).v
SYNTH=arqui_Synth.v
VCD=$(NOMBRE).vcd
VC=iverilog

EJEC=bancoEV
VR=vvp
FLAGSVC= -o $(EJEC)

FLAGSLIMP=rm *.vcd $(EJEC) *.dot *.pdf $(SYNTH)

YOSYS=yosys
YOSFILE=yosy.ys
GTKCONFIG=config.gtkw
GTK=gtkwave

ORIG=arqui
FINAL=arqui_Synth
 

all: sintetizar compilar visualizar limpiar
	

sintetizar:
	$(YOSYS) $(YOSFILE)
	sed -i 's/module fifo\b/module fifoSynth/g' $(SYNTH)
	#sed -i '2i\`include "./CMOS/cmos_cells.v"\' $(SYNTH)
	sed -i 's/cond/estruct/g' $(SYNTH)
	sed -i 's/module RAM_memory/module RAM_memorySynth/g' $(SYNTH)
	
	#module namechange	
	sed -i 's/module arqui/module arqui_Synth/g' $(SYNTH)
	sed -i 's/module demux_d/module demux_d_Synth/g' $(SYNTH)
	sed -i 's/module demux_vc/module demux_vc_Synth/g' $(SYNTH)
	sed -i 's/module fifo_d0/module fifo_d0_Synth/g' $(SYNTH)
	sed -i 's/module fifo_d1/module fifo_d1_Synth/g' $(SYNTH)
	sed -i 's/module fifo_main/module fifo_main_Synth/g' $(SYNTH)
	sed -i 's/module fifo_vc0/module fifo_vc0_Synth/g' $(SYNTH)
	sed -i 's/module fifo_vc1/module fifo_vc1_Synth/g' $(SYNTH)
	sed -i 's/module fsm/module fsm_Synth/g' $(SYNTH)
	sed -i 's/module mux/module mux_Synth/g' $(SYNTH)
	sed -i 's/module output_flow/module output_flow_Synth/g' $(SYNTH)
	sed -i 's/module input_flow/module input_flow_Synth/g' $(SYNTH)
	#partnamechange
	sed -i 's/RAM_memory/RAM_memory_Synth/g' $(SYNTH)
	sed -i 's/fifo_d0\b/fifo_d0_Synth/g' $(SYNTH)
	sed -i 's/fifo_d1\b/fifo_d1_Synth/g' $(SYNTH)
	sed -i 's/demux_d\b/demux_d_Synth/g' $(SYNTH)
	sed -i 's/demux_vc\b/demux_vc_Synth/g' $(SYNTH)
	sed -i 's/fsm\b/fsm_Synth/g' $(SYNTH)
	sed -i 's/fifo_main\b/fifo_main_Synth/g' $(SYNTH)
	sed -i 's/fifo_vc0\b/fifo_vc0_Synth/g' $(SYNTH)
	sed -i 's/fifo_vc1\b/fifo_vc1_Synth/g' $(SYNTH)
	sed -i 's/mux\b/mux_Synth/g' $(SYNTH)
	sed -i 's/output_flow\b/output_flow_Synth/g' $(SYNTH)
	sed -i 's/input_flow\b/input_flow_Synth/g' $(SYNTH)
	#sed -i '`include "./CMOS/cmos_cells.v"' $(SYNTH)
compilar:
	$(VC) $(BANCO) $(FLAGSVC)
	$(VR) $(EJEC)
visualizar:
	$(GTK) $(GTKCONFIG) 

limpiar: 
	$(FLAGSLIMP)


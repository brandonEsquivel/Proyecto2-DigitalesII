NOMBRE=bancopruebas
BANCO=$(NOMBRE).v
SYNTH=fifoSynth.v
VCD=$(NOMBRE).vcd
VC=iverilog

EJEC=banco
VR=vvp
FLAGSVC= -o $(EJEC)

FLAGSLIMP=rm *.vcd $(EJEC) *.dot *.pdf $(SYNTH)

YOSYS=yosys
YOSFILE=yosy.ys
GTKCONFIG=config.gtkw
GTK=gtkwave

ORIG=fifo
FINAL=fifoSynth
 

all: sintetizar compilar visualizar limpiar
	

sintetizar:
	$(YOSYS) $(YOSFILE)
	sed -i 's/module fifo\b/module fifoSynth/g' $(SYNTH)
	#sed -i '2i\`include "./CMOS/cmos_cells.v"\' $(SYNTH)
	sed -i 's/cond/estruct/g' $(SYNTH)
	sed -i 's/RAM_memory\b/RAM_memorySynth/g' $(SYNTH)
	#sed -i 's/module fifo/module fifoSynth/g' $(SYNTH)
	#sed -i '`include "./CMOS/cmos_cells.v"' $(SYNTH)
compilar:
	$(VC) $(BANCO) $(FLAGSVC)
	$(VR) $(EJEC)
visualizar:
	$(GTK) $(VCD) $(GTKCONFIG) 

limpiar: 
	$(FLAGSLIMP)


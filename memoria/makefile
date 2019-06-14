# @Date 06/06/2019
# @Brief makefile para la Tarea #8 en la que se desarrolla una descripción conductual con 5 bits en la entrada y la salida

# Tags de Variables de Programa
CC := iverilog
CC_SYNTH := yosys
CC_RUN := vvp
VISUAL := gtkwave
YS = yosy.ys

# Tags de Variables de modulo con valores por defecto 
TOP_NAME := contador_gray_cond
TARGET_TOP := testbench.v
TARGET_VIS := contador_gray.vcd
GTK_CONFIG := config.gtkw
OUTPUT_SIM := contador.out
export LIB := CMOS/cmos_cells.lib
export VLOG_FILE_NAME := testbench.v
NEW_VLOG_FILE_NAME = $(TOP_NAME)_synth.v
export TOP_MODULE := $(TOP_NAME) 
NEW_TOP_MODULE = $(TOP_NAME)_synth
export OUTPUT_SYNTH = $(TOP_NAME)_synth.v

.PHONY: clean

autoinst_verilog: 
	emacs --batch --no-site-file -l verilog-mode.el probador.v checker.v -f verilog-auto -f save-buffer

assign_testbench:
	$(eval TARGET_TOP = testbench.v)

all: 
	$(MAKE) testbench
	@echo 'All Done'

compile:
	@echo 'Compiling Design $(TARGET_TOP)'
	$(CC) $(TARGET_TOP) -o $(OUTPUT_SIM)

run: 
	@echo 'Running Design $(TARGET_TOP)'
	$(CC_RUN) $(OUTPUT_SIM)

sim: 
	@echo 'Show simulation on GTKWave $(TARGET_VIS)'
	$(VISUAL) $(TARGET_VIS) $(GTK_CONFIG)

#synth:
#	@echo 'Synthetizing module $(TOP_MODULE) with $(LIB)'
#	$(CC_SYNTH) $(YS)
#rename:
#	@echo 'Renaming module $(NEW_TOP_MODULE)'
#	sed -i 's/$(TOP_MODULE)/$(NEW_TOP_MODULE)/' $(NEW_VLOG_FILE_NAME)

testbench: assign_testbench compile run sim clean
	@echo 'Testbench has been tested'

clean: 
	rm *.out	
	@echo 'Clean directory succesful...'

$(V).SILENT:

# end

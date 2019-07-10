# @Date 01/07/2019
# @Brief makefile para la Tarea #8 en la que se desarrolla una descripción conductual con 5 bits en la entrada y la salida

# Tags de Variables de Programa
CC := iverilog
CC_SYNTH := yosys
CC_RUN := vvp
VISUAL := gtkwave
YS = yosy.ys

# Tags de Variables de modulo con valores por defecto 
TOP_NAME = arqui.v
TARGET_TOP := testbench.v
TARGET_VIS := arqui.vcd
GTK_CONFIG := config.gtkw
OUTPUT_SIM := RAM.out
export LIB := CMOS/cmos_cells.lib
export VLOG_FILE_NAME := arqui.v
NEW_VLOG_FILE_NAME = arqui_Synth.v
export TOP_MODULE := arqui 
NEW_TOP_MODULE = $(TOP_NAME)_Synth
export OUTPUT_SYNTH = $(TOP_NAME)_Synth.v

.PHONY: clean

all: compile synth rename assign assign_testbench
	$(MAKE) testbench
	@echo 'All Done'

autoinst_verilog: 
	emacs --batch --no-site-file -l verilog-mode.el arqui.v -f verilog-auto -f save-buffer

assign_testbench:
	$(eval TARGET_TOP = testbench.v)

compile:
	@echo 'Compiling Design $(TARGET_TOP)'
	$(CC) $(TARGET_TOP) -o $(OUTPUT_SIM)

run: 
	@echo 'Running Design $(TARGET_TOP)'
	$(CC_RUN) $(OUTPUT_SIM)

sim: 
	@echo 'Show simulation on GTKWave $(TARGET_VIS)'
	$(VISUAL) $(TARGET_VIS) $(GTK_CONFIG)

synth:
	@echo 'Synthetizing module $(TOP_MODULE) with $(LIB)'
	$(CC_SYNTH) $(YS)
rename:
	@echo 'Renaming module $(NEW_TOP_MODULE)'
	sed -i -E "s,arqui\b,arqui_Synth," $(NEW_VLOG_FILE_NAME)
	
testbench: compile run sim clean
	@echo 'Testbench has been tested'

clean: 
	rm *.out	
	@echo 'Clean directory succesful...'

$(V).SILENT:

# end

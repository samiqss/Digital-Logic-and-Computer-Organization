# Makefile for ssbc
# P Walsh Feb 2010
# Revised June 2013 for behaviour only  modules
# Sami Al-Qusus   Nov 2018   Modified for MMA 
# 
# Targets
#   behaviour --- make batch test for behaviour description
#   clean

# directory where CEW scripts are located and temp files
SD=../../../../Cew
VI=Include
MOD=Control_Unit/behaviour.v Data_Path/behaviour.v Memory_Unit/behaviour.v

# code beautifier
INDENT=cat

behaviour: mybehaviour
	vvp mybehaviour

runtest: mybehaviour
	@csh .batch_test
	-more log	

clean:
	rm -f  $(SD)/tmp/* mybehaviour 
	(cd Data_Path; make clean)
	(cd Control_Unit; make clean)
	(cd Memory_Unit; make clean)
	touch $(SD)/tmp/README

mybehaviour: mma.v $(MOD)
	iverilog -Wall -I $(VI) -o mybehaviour mma.v $(MOD)


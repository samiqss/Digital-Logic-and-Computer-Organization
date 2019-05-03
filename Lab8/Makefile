# Makefile to drive cew testing of verilog
# P Walsh Feb 2010
# Revised June 2013 for Lab* modules

# Targets
#   behaviour --- make batch test for behaviour description
#   btiming   --- make behaviour timing diagram
#   ttl       --- make batch tester ttl description
#   ttiming   --- make ttl timing diagram
#   clean

# module identifier
MID=moore
# path to TTL module library directory
TTLLIBDIR=../../TTL
# TTL modules
TTLLIB=$(TTLLIBDIR)/sn7476/behaviour.v $(TTLLIBDIR)/sn7432/behaviour.v $(TTLLIBDIR)/sn7408/behaviour.v $(TTLLIBDIR)/sn7404/behaviour.v
# directory where CEW scripts are located and temp files
SD=../../Cew
# code beautifier 
INDENT=cat

behaviour: mybehaviour
	vvp mybehaviour
	mv test_bench.vcd behaviour.vcd

ttl: myttl
	vvp myttl
	mv test_bench.vcd ttl.vcd

behaviour.vcd: tb.cew behaviour.v
	make behaviour

btiming: behaviour.vcd
	gtkwave behaviour.vcd

ttl.vcd: tb.cew ttl.v $(TTLLIB)
	make ttl

ttiming: ttl.vcd
	gtkwave ttl.vcd

tb.v: tb.cew
	rm -f $(SD)/tmp/tb.v
	awk -f $(SD)/bin/addLineNums.awk tb.cew > $(SD)/tmp/tb.num
	m4  -I $(SD)/bin $(SD)/tmp/tb.num | $(INDENT)  > tb.v

clean:
	rm -f  $(SD)/tmp/* mybehaviour myttl tb.v *.vcd

mybehaviour: tb.v behaviour.v 
	iverilog -Wall -o mybehaviour tb.v behaviour.v

myttl: tb.v ttl.v $(TTLLIB)
	iverilog -Wall -o myttl tb.v ttl.v $(TTLLIB)

submit:
	@echo "nothing to submit for the $(MID) module"

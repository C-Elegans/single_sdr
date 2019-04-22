SCALASRC=$(wildcard src/main/scala/singlesdr/*.scala)
FFTSRC=$(wildcard dblclockfft/fft-core/*.v)

all: Top_out.config

Top_out.config: Top.json
	nextpnr-ecp5 --json Top.json --basecfg /usr/local/share/trellis/misc/basecfgs/empty_lfe5um5g-85f.config --textcfg Top_out.config --um5g-85k --package CABGA381

Top.json: Top.v mult18x18.v $(FFTSRC)
	yosys -p "synth_ecp5 -json $@"  $^

Top.v: $(SCALASRC) $(FFTSRC)
	sbt run

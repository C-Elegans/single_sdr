SCALASRC=$(wildcard src/main/scala/singlesdr/*.scala)
FFTSRC=fft-core/bimpy.v fft-core/bitreverse.v fft-core/butterfly.v
FFTSRC+=fft-core/convround.v fft-core/fftmain.v fft-core/fftstage.v
FFTSRC+=fft-core/hwbfly.v fft-core/laststage.v fft-core/longbimpy.v
FFTSRC+=fft-core/qtrstage.v fft-core/shiftaddmpy.v
RTL=$(wildcard rtl/*.v)

all: Top_out.config

dblclkfft/sw/fftgen:
	$(MAKE) -C dblclockfft



gen-fft: dblclkfft/sw/fftgen
	mkdir -p fft-core
	./dblclockfft/sw/fftgen -d fft-core -f 256 -1 -n 12 -x 2 -c 0 -p 30
	cp fft-core/*.hex ./

Top_out.config: Top.json
	nextpnr-ecp5 --json Top.json --basecfg /usr/local/share/trellis/misc/basecfgs/empty_lfe5um5g-85f.config --textcfg Top_out.config --um5g-85k --package CABGA381

Top.json: Top.v $(FFTSRC) $(RTL)
	yosys -p "synth_ecp5 -json $@"  $^

Top.v: $(SCALASRC) $(FFTSRC) $(RTL)
	sbt run

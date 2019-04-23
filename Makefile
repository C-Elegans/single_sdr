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
	./dblclockfft/sw/fftgen -d fft-core -f 256 -1 -n 12 -x 0 -c 0 -m 18 -p 30 -u
	cp fft-core/*.hex ./

Top_out.config: Top.json
	nextpnr-ecp5 --json Top.json --basecfg /usr/local/share/trellis/misc/basecfgs/empty_lfe5u-45f.config --textcfg Top_out.config --45k --package CABGA381 --freq 100

Top.json: Top.v $(FFTSRC) $(RTL)
	yosys -p "synth_ecp5 -json $@"  $^

Top.v: $(SCALASRC) $(FFTSRC) $(RTL)
	sbt run

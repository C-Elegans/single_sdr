

Top.json: Top.v mult18x18.v
	yosys -p "synth_ecp5 -json $@"  $^

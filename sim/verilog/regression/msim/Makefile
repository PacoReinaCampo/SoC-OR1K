all: build

build:
	@if [ ! -e work ]; then vlib work; fi
	@vlog -sv -f soc.vc
	vsim -c -do run.do work.or1k_tile_testbench

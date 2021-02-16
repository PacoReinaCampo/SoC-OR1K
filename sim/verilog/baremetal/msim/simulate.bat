@echo off
call ../../../../../../settings64_msim.bat

vlib work
vlog -sv -f soc.vc
vsim -c -do run.do work.or1k_tile
pause

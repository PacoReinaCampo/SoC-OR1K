@echo off
call ../../../../settings64_vivado.bat

xvlog -prj soc.prj \
-i ../../../../pu/rtl/verilog/pkg \
-i ../../../../rtl/verilog/soc/bootrom \
-i ../../../../dma/rtl/verilog/wb/pkg
xelab soc_or1k_testbench
xsim -R soc_or1k_testbench
pause

all: hardware-mpsoc2d software-mpsoc2d

hardware-tile:
	verilator -f soc.vc --trace -Wno-fatal -Wno-lint -Wno-UNOPTFLAT -Wno-COMBDLY -CFLAGS "-std=c++11" -LDFLAGS "-pthread"
	make -f Vsoc_or1k_tile_testbench.mk

hardware-mpsoc2d:
	verilator -f mpsoc2d.vc --trace -Wno-fatal -Wno-lint -Wno-UNOPTFLAT -Wno-COMBDLY -CFLAGS "-std=c++11" -LDFLAGS "-pthread"
	make -f Vmpsoc2d_or1k_testbench.mk

hardware-mpsoc3d:
	verilator -f mpsoc3d.vc --trace -Wno-fatal -Wno-lint -Wno-UNOPTFLAT -Wno-COMBDLY -CFLAGS "-std=c++11" -LDFLAGS "-pthread"
	make -f Vmpsoc3d_or1k_testbench.mk

hardware-mpsoc4d:
	verilator -f mpsoc4d.vc --trace -Wno-fatal -Wno-lint -Wno-UNOPTFLAT -Wno-COMBDLY -CFLAGS "-std=c++11" -LDFLAGS "-pthread"
	make -f Vmpsoc4d_or1k_testbench.mk

software-tile:
	./Vsoc_or1k_tile_testbench --meminit=../../../../../../software/baremetal/heat_mp_simple/c/heat_mp_simple.vmem
	./Vsoc_or1k_tile_testbench --meminit=../../../../../../software/baremetal/hello/c/hello.vmem
	./Vsoc_or1k_tile_testbench --meminit=../../../../../../software/baremetal/hello_mp/c/hello_mp.vmem
	./Vsoc_or1k_tile_testbench --meminit=../../../../../../software/baremetal/hello_mp_simple/c/hello_mp_simple.vmem

software-mpsoc2d:
	./Vmpsoc2d_or1k_testbench --meminit=../../../../../../software/baremetal/hello/c/hello.vmem
	./Vmpsoc2d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp/c/hello_mp.vmem
	./Vmpsoc2d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp_simple/c/hello_mp_simple.vmem

software-mpsoc3d:
	./Vmpsoc3d_or1k_testbench --meminit=../../../../../../software/baremetal/hello/c/hello.vmem
	./Vmpsoc3d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp/c/hello_mp.vmem
	./Vmpsoc3d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp_simple/c/hello_mp_simple.vmem

software-mpsoc4d:
	./Vmpsoc4d_or1k_testbench --meminit=../../../../../../software/baremetal/hello/c/hello.vmem
	./Vmpsoc4d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp/c/hello_mp.vmem
	./Vmpsoc4d_or1k_testbench --meminit=../../../../../../software/baremetal/hello_mp_simple/c/hello_mp_simple.vmem

clear:
	rm -rf *.a *.cpp *.d *.dat *.h *.o *.mk

clean:
	rm -rf *.a *.cpp *.d *.dat *.h *.o *.mk Vsoc_or1k_* stdout.*

#! /bin/sh

ghdl -a --ieee=synopsys -fexplicit $1
ghdl -a --ieee=synopsys -fexplicit $2
ghdl -e --ieee=synopsys -fexplicit $3
ghdl -r --ieee=synopsys -fexplicit TopCollatz --vcd=TopCollatz.vcd --stop-time=2ms

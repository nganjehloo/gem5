#!/usr/bin/env bash

bms=`find benchmarks -type d -links 2 | cut -f2 -d'/'`

# u-ops stat
# Zen (epyc7451): rc1
# Skylake (i7-7700): uops_executed.thread
# Sandybridge (E5-1607): uops_retired.all

for D in $bms
do
    cd benchmarks/$D
    mkdir -p ../../res/perf/$D
    echo "Running $D"
    perf stat -x' ' -o ../../res/perf/$D/epyc7451 -e instructions,cpu-cycles,rc1 ./$D > reference.out
    cd - > /dev/null
done

#!/usr/bin/env bash

bms=`find benchmarks -type d -links 2 | cut -f2 -d'/'`

for D in $bms
do
    cd benchmarks/$D
    mkdir -p ../../res/perf/$D
    echo "Running $D"
    perf stat -x' ' -o ../../res/perf/$D/epyc7451 -e instructions,cpu-cycles ./$D > reference.out
    cd - > /dev/null
done

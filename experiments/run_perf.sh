#!/usr/bin/env bash

bms=`find benchmarks -type d -links 2 | cut -f2 -d'/'`

for D in $bms
do
    cd benchmarks/$D
    perf stat -e instructions,cpu-cycles ./$D > /dev/null 2> ../../res/perf/$D
    cd -
done

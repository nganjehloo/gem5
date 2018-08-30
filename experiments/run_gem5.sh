#!/usr/bin/env bash

bms=`find benchmarks -type d -links 2 | cut -f2 -d'/'`
cpus=( O3CPU SimpleCPU FlexCPU MinorCPU )

cd ..
for bm in $bms
do
    for cpu in "${cpus[@]}"
    do
        build/X86/gem5.opt \
            -re --outdir=experiments/res/gem5/$bm/$cpu \
            configs/my_configs/se-experiments/run.py \
                $cpu experiments/benchmarks/$bm/$bm &
    done
done
cd -

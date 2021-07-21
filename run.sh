#!/bin/bash

clang -O2 -std=c99 -fopenmp -o matrix matrix.c
counter=0

until [[ $counter -gt 10 ]]
do
    ./matrix
    ((counter++))
done
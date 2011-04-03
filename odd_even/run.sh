#!/bin/bash
exec=$1
for testcase in case*.in; do
    echo "Running against ${testcase}..."
    cat $testcase | $exec
    
    answer=$(cat $(basename $testcase .in).out)
    echo $answer
done
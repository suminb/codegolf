#!/bin/bash
exec=$1
for testcase in case??.txt; do
    echo "Running against ${testcase}..."
    cat $testcase | $exec
    
    answer=$(cat $(basename $testcase .txt)_answer.txt)
    echo $answer
done
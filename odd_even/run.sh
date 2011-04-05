#!/bin/bash

E=$(printf '\033')      # escape <E>
R="${E}[0m"             # reset  <E>[0m

trim() { echo $1; }

passed=0
total=$(trim $(ls test*.in|wc -l))
exec=$1
for testcase in test*.in; do
    echo -n "Running against ${testcase}..."
    useranswer=$(trim $(cat $testcase | $exec))
    answer=$(trim $(cat $(basename $testcase .in).out))
    
    if [ "${answer}" = "${useranswer}" ]; then
        echo -e "${E}[32mPassed${R}"
        passed=`expr $passed + 1`
    else
        echo -en "${E}[31mFailed${R}"
        echo " (Expected '${answer}', but '${useranswer}' was returned)"
    fi
    
    #echo "$useranswer $answer"
done

echo "${passed}/${total}"

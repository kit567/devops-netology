#!/bin/bash
urls=(http://192.168.0.1 http://173.194.222.113 http://87.250.250.242)
set -o pipefail 

for url in ${urls[@]}
    do 
        echo "Checking URL $url"
        i=0
        while [ $i -lt 5 ]
            do
                curl --fail-early -I -m 5 --url $url | head -n 1 | tee -a check.log 2>&1
	            echo $? "-error code">> check.log
                (( i++ ))
            done
    echo "Done checking $url"
    done
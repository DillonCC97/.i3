#!/bin/bash

i3status --config ~/.i3/i3status.conf | while :
do
        read line
        playing=$(ncmpcpp --current-song)
        if [ -n $playing ]
           then
               space=""
        else
            space="|"
        fi
        CLEAN=${playing//$/S}
        CLEAN=${CLEAN//&/and}
        echo "$CLEAN $space $line" || exit 1
done


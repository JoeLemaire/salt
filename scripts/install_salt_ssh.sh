#!/bin/bash

datetime=$(date "+%F_%T")
echo Script started at $datetime
for server in $(cat serverlisting.txt) ;
do
        if grep --quiet $server /etc/salt/roster ; then
                echo $server - Already added to roster
        else
                echo $server - Adding to roster
                printf "$server: \n" >> /etc/salt/roster
                printf "  host: $server \n" >> /etc/salt/roster
                printf "  user: root \n" >> /etc/salt/roster
                printf "  passwd: p@rad0x_ \n" >> /etc/salt/roster
                printf "\n" >> /etc/salt/roster
                echo $server - Added to roster
fi

starttime=$SECONDS
echo $server - Running commands
# Uncomment below to run a test only
#salt-ssh --state-output=full $server -i state.apply test=True >> result-$datetime.txt
# Uncommment below to run the actual command
salt-ssh --state-output=full $server -i state.apply >> result-$datetime.txt
laststatus=$?
elapsedtime=$(($SECONDS - $starttime))
echo "$server - Commands ran (status:$laststatus,duration(secs):$elapsedtime)"

done
exit 0
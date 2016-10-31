#!/bin/bash

minecraftLog="/opt/bungee/proxy.log.0"
user=""
server=""

ssh -p2222 -t $user@$server tail -fn0 $minecraftLog | \
while read line ; do
test=$( echo "$line" | grep "dispatch")

if [ $? = 0 ]
then
test=$( echo "$line" | grep "dispatch")
echo $test

sname=$( echo "$line" | grep "dispatch" | awk '{print $7}')
command=$( echo "$line" | grep "dispatch" | awk '{print $8}')
name=$( echo "$line" | grep "dispatch" | awk '{print $10}')
bal=$( echo "$line" | grep "dispatch" | awk '{print $11}')

echo "$sname in $command $name $bal"


if [ "$command" =  "eco" ]; then

tmux send-keys -t $sname 'econ add '$name' '$bal'' Enter
tmux send-keys -t $sname 'broadcast &4everyone thank '$name' for donating to the server' Enter
fi

fi
done



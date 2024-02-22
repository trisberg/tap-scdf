#!/bin/bash

SHELL=/shell.sh
STREAM=$1

n=$(grep -e name: $STREAM)
name=${n##name: }
d=$(grep -e definition: $STREAM)
definition=${d##definition: }
dp=$(grep -e deploymentProperties: $STREAM)
deploymentProperties=${dp##deploymentProperties: }

echo "stream info $name" > exists.cmd
$SHELL --dataflow.uri=$SCDF_URL --spring.shell.commandFile=exists.cmd > exists.txt 2>&1
exists=$(grep ║$name exists.txt)

if [ -z "$exists" ]; then
  echo "CREATE $name"
  echo "stream create --name $name --definition \"$definition\" --deploy false" > stream.cmd
  echo "stream deploy --name $name --properties \"$deploymentProperties\"" >> stream.cmd
else
  echo "UPDATE $name"
  echo "stream update --name $name --properties \"$deploymentProperties\"" > stream.cmd
fi
$SHELL --dataflow.uri=$SCDF_URL --spring.shell.commandFile=stream.cmd > stream.txt 2>&1
cat stream.txt

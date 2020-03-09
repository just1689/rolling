#!/bin/bash
input="history"
prev=""
live=$( cat current )
next="false"


while IFS= read -r line
do
  if [ "$next" == "true" ]; then
    break;                                                                                                                                                                                                                                                                                                                  break;
  fi
  if [ "$line" == "$live" ]; then
    next="true"
    continue;
  fi
  prev=$line
done < "$input"


if [ "$line" == "" ]; then
  echo "No version after $live, stopping..."
  exit 0;
fi
echo "> Current versio should be: $line"
echo "$line" > current

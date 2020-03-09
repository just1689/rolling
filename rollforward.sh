#!/bin/bash
input="history"
prev=""
live=$( cat current )
next="false"
while IFS= read -r line
do
  # echo "$line"
  if [ "$next" == "true" ]; then
    break;                                                                                                                                                                                                                                                                                                                  break;
  fi

  # Do the thing
  if [ "$line" == "$live" ]; then
    next="true"
    continue;
  fi

  prev=$line

done < "$input"


if [ "$line" == "" ]; then
  echo "No version after $next, stopping..."
  exit 0;
fi


echo "> The next version is: $line"
echo "$line" > current

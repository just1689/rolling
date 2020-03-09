#!/bin/bash


input="history"
prev=""
live=$( cat current )
next="false"


while IFS= read -r line
do
  first=""
  second=""
  delimiter="@"
  string=$line$delimiter
  myarray=()
  while [[ $string ]]; do
    myarray+=( "${string%%"$delimiter"*}" )
    string=${string#*"$delimiter"}
  done
  for value in ${myarray[@]}
  do
    if [ "$first" == "" ]; then
      first="$value"
    else
      second="$value"
    fi
  done



  if [ "$next" == "true" ]; then
    break;                                                                                                                                                                                                                                                                                                                  break;
  fi
  if [ "$first" == "$live" ]; then
    next="true"
    continue;
  fi
  prev=$first
done < "$input"


if [ "$first" == "" ]; then
  echo "No version after $live, stopping..."
  exit 0;
fi
echo "> Current version should be: $first from: $second"
echo "$first" > current

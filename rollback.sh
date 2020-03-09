#!/bin/bash
input="history"
prev=""
live=$( cat current )


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


  if [ "$first" == "$live" ]; then
    break;
  fi
  prev=$first
done < "$input"


if [ "$prev" == "" ]; then
  echo "No previous changes found.. Can't rollback"
  exit 0;
fi
echo "> Current version should be: $prev from: $second"
echo "$prev" > current

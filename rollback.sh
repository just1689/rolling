#!/bin/bash
input="history"
prev=""
live=$( cat current )
echo "The last live version was: $live"


while IFS= read -r line
do
  if [ "$line" == "$live" ]; then
    break;
  fi
  prev=$line
done < "$input"


if [ "$prev" == "" ]; then
  echo "No previous changes found.. Can't rollback"
  exit 0;
fi
echo "> Current versio should be: $prev"
echo "$prev" > current

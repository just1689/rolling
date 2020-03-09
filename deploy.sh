#!/bin/bash

x=$(date '+%F.+%T')
echo "$1@$x" >> history

#!/bin/bash


getYear(){
  return $(date +%Y)
}

getMonth(){
  return $(date +%m)
}

getHour(){
  hh=$(date +%H)
  return `expr $hh - 11`
}

showParam(){
  echo "$1"
  echo "$2"
  echo "$3"
}

getYear
yy=$?
getMonth
mm=$?

if [ $mm -lt 9 ]; then
mm="0$mm"
fi

getHour
hh=$?
echo "$yy"
echo "$mm"
echo "$hh"
showParam $yy $mm $hh

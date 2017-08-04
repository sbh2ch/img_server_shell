#!/bin/sh
# 파일이 존재하지 않을 시 FTP로 파일 들고오기.
# FTP로도 없을 시 메일 알림 및 10분 후 재시도

# 파일 유무 체크, 있을시 1 반환 없을시 0 반환
fileCheck(){
  TIME=$1
  YY=`date '+%Y'`
  MM=`date '+%m'`
  DD=`date '+%d'`
  
  ls /home/dev/originalImages/$YY/$MM/$DD | grep COMS_GOCI_BI_$YY$MM$DD$TIME\
  && return 1\
  || return 0;
}

divide() {
  echo "divide it!"
}

sendAlertEmail() {
  echo "send a mail"
}

getFromFTP() {
  echo "ftp"
}

fileCheck 00
if [ "$?" -eq "1" ]; then
  echo "ok"
  divide
else
  echo "no such file exception"
  echo "try to get JPG file via FTP"
  getFromFTP 01
  fileCheck 00
  if [ "$?" -eq "1" ]; then
    echo "ok"
    divide
  else
    echo "retry after 3secs"
    echo "3"
    sleep 1
    echo "2"
    sleep 1
    echo "1"
    sleep 1
    fileCheck 00
    if [ "$?" -eq "1" ]; then
      echo "ok"
      divide
    else
      echo "rt: no such file exception"
      sendAlertEmail
    fi
  fi
fi

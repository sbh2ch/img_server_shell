#!/bin/sh
# 파일이 존재하지 않을 시 FTP로 파일 들고오기.
# FTP로도 없을 시 메일 알림 및 10분 후 재시도

YY=`date '+%Y'`
MM=`date '+%m'`
DD=`date '+%d'`
TIME=01

# 파일 유무 체크, 있을시 1, 없을시 0
fileCheck(){
  ls /home/dev/originalImages/$YY/$MM/$DD | grep COMS_GOCI_BI_$YY$MM$DD$TIME\
  && return 1\
  || return 0;
}

# 파일 분할
divide() {
  FILENAME=`find /home/dev/originalImages/$YY/$MM/$DD -name COMS_GOCI_BI_$YY$MM$DD$TIME*.JPG`
  echo "divide [[ $FILENAME ]]"
  convert $FILENAME -crop 5000x5000+300+300 /home/dev/originalImages/$YY/$MM/$DD/RGB_$TIME.JPG
}
tttt() {
# for loop test
  for i in `seq 0 5`
  do
    for j in `seq 0 5`
    do
      xPos=$j
      yPos=$i
      startX=`expr $j \* 800`
      startY=`expr $i \* 800`
      convert -crop 800x800+$startX+$startY $FILENAME /home/dev/result/$xPos-$yPos.JPG
    done
  done
}

# 경고 메일 발송
sendAlertEmail() {
  echo "send a mail"
  echo "COMS_GOCI_BI_$YY$MM$DD$TIME [[RGB]] is not exist!" | mail -s "COMS_GOCI_BI_$YY$MM$DD$TIME [[RGB]] is not exist!" sbh2ch@gmail.com byunghwa.son@kiost.ac.kr
}

# FTP로 자료 끌어오기
getFromFTP() {
  echo "ftp"
}

forloop

fileCheck
if [ "$?" -eq "1" ]; then
  echo "ok"
  divide
else
  echo "no such file exception"
  echo "try to get JPG file via FTP"
  getFromFTP
  fileCheck
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
    fileCheck
    if [ "$?" -eq "1" ]; then
      echo "ok"
      divide
    else
      echo "no such file exception : retry"
      sendAlertEmail
    fi
  fi
fi

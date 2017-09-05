#!/bin/bash

testee(){
    echo "current date is $(date +%Y-%m-%d)"
    echo "current time is $(date +%H:%M:%S)"
}

getYear(){
    return "$(date +%Y)"  
}

getMonth(){
    return $(date +%m)
}

getDay(){
    return $(date +%d)
}

getHour() {
    hh=$(date +%H)
    return `expr $hh - 11`
}

make_dir(){
    cnt=3
    while [ $cnt -lt 7 ]
    do  
      echo "$cnt mk dir!"
      mkdir -p /home/kosc/img/$1/$2/$3/$4/$cnt/CDOM
      mkdir -p /home/kosc/img/$1/$2/$3/$4/$cnt/TSS
      mkdir -p /home/kosc/img/$1/$2/$3/$4/$cnt/CHL
      mkdir -p /home/kosc/img/$1/$2/$3/$4/$cnt/RGB    
      cnt=`expr $cnt + 1`
    done
}

setup(){
    convert -crop 5000x5000+300+300 /home/dev/ori/CDOM/$1/$2/$3/$4/COMS_GOCI_L2A_GA_$1$2$3$4.CDOM.BI.JPG /home/dev/ori/CDOM/$1/$2/$3/$4/SETUP_$1$2$3$4.CDOM.JPG
    convert -crop 5000x5000+300+300 /home/dev/ori/TSS/$1/$2/$3/$4/COMS_GOCI_L2A_GA_$1$2$3$4.TSS.BI.JPG /home/dev/ori/TSS/$1/$2/$3/$4/SETUP_$1$2$3$4.TSS.JPG
    convert -crop 5000x5000+300+300 /home/dev/ori/CHL/$1/$2/$3/$4/COMS_GOCI_L2A_GA_$1$2$3$4.CHL.BI.JPG /home/dev/ori/CHL/$1/$2/$3/$4/SETUP_$1$2$3$4.CHL.JPG
    convert -crop 5000x5000+300+300 /home/dev/ori/RGB/$1/$2/$3/$4/COMS_GOCI_BI_$1$2$3$4.JPG /home/dev/ori/RGB/$1/$2/$3/$4/SETUP_$1$2$3$4.RGB.JPG
}

make_6_img(){
    yPos=0
    while [ $yPos -lt 6 ]
    do
        xPos=0
        while [ $xPos -lt 6 ]
        do
	    startX=`expr $xPos \* 800`
	    startY=`expr $yPos \* 800`
	    echo "${xPos}-${yPos}.jpg"
	    echo "${startX} ${startY}"
	    convert -crop 800x800+$startX+$startY /home/dev/ori/CDOM/$1/SETUP_$2.CDOM.JPG /home/kosc/img/$1/3/CDOM/$xPos-$yPos.JPG
	    convert -crop 800x800+$startX+$startY /home/dev/ori/TSS/$1/SETUP_$2.TSS.JPG /home/kosc/img/$1/3/TSS/$xPos-$yPos.JPG
            convert -crop 800x800+$startX+$startY /home/dev/ori/CHL/$1/SETUP_$2.CHL.JPG /home/kosc/img/$1/3/CHL/$xPos-$yPos.JPG
            convert -crop 800x800+$startX+$startY /home/dev/ori/RGB/$1/SETUP_$2.RGB.JPG /home/kosc/img/$1/3/RGB/$xPos-$yPos.JPG
            xPos=`expr $xPos + 1`
	done
	yPos=`expr $yPos + 1`
        echo ""
    done
}


make_12_img(){
    yPos=0
    while [ $yPos -lt 12 ]
    do
        xPos=0
        while [ $xPos -lt 12 ]
        do
            startX=`expr $xPos \* 400`
            startY=`expr $yPos \* 400`
            echo "${xPos}-${yPos}.jpg"
            echo "${startX} ${startY}"
            convert -crop 400x400+$startX+$startY /home/dev/ori/CDOM/$1/SETUP_$2.CDOM.JPG /home/kosc/img/$1/4/CDOM/$xPos-$yPos.JPG
            convert -crop 400x400+$startX+$startY /home/dev/ori/TSS/$1/SETUP_$2.TSS.JPG /home/kosc/img/$1/4/TSS/$xPos-$yPos.JPG
            convert -crop 400x400+$startX+$startY /home/dev/ori/CHL/$1/SETUP_$2.CHL.JPG /home/kosc/img/$1/4/CHL/$xPos-$yPos.JPG
            convert -crop 400x400+$startX+$startY /home/dev/ori/RGB/$1/SETUP_$2.RGB.JPG /home/kosc/img/$1/4/RGB/$xPos-$yPos.JPG
            xPos=`expr $xPos + 1`
        done
        yPos=`expr $yPos + 1`
        echo ""
    done
}



make_25_img(){
    yPos=0
    while [ $yPos -lt 25 ]
    do
        xPos=0
        while [ $xPos -lt 25 ]
        do
            startX=`expr $xPos \* 200`
            startY=`expr $yPos \* 200`
            echo "${xPos}-${yPos}.jpg"
            echo "${startX} ${startY}"
            convert -crop 200x200+$startX+$startY /home/dev/ori/CDOM/$1/SETUP_$2.CDOM.JPG /home/kosc/img/$1/5/CDOM/$xPos-$yPos.JPG
            convert -crop 200x200+$startX+$startY /home/dev/ori/TSS/$1/SETUP_$2.TSS.JPG /home/kosc/img/$1/5/TSS/$xPos-$yPos.JPG
            convert -crop 200x200+$startX+$startY /home/dev/ori/CHL/$1/SETUP_$2.CHL.JPG /home/kosc/img/$1/5/CHL/$xPos-$yPos.JPG
            convert -crop 200x200+$startX+$startY /home/dev/ori/RGB/$1/SETUP_$2.RGB.JPG /home/kosc/img/$1/5/RGB/$xPos-$yPos.JPG
            xPos=`expr $xPos + 1`
        done
        yPos=`expr $yPos + 1`
        echo ""
    done
}



make_50_img(){
    yPos=0
    while [ $yPos -lt 50 ]
    do
        xPos=0
        while [ $xPos -lt 50 ]
        do
            startX=`expr $xPos \* 100`
            startY=`expr $yPos \* 100`
            echo "${xPos}-${yPos}.jpg"
            echo "${startX} ${startY}"
            convert -crop 100x100+$startX+$startY /home/dev/ori/CDOM/$1/SETUP_$2.CDOM.JPG /home/kosc/img/$1/6/CDOM/$xPos-$yPos.JPG
            convert -crop 100x100+$startX+$startY /home/dev/ori/TSS/$1/SETUP_$2.TSS.JPG /home/kosc/img/$1/6/TSS/$xPos-$yPos.JPG
            convert -crop 100x100+$startX+$startY /home/dev/ori/CHL/$1/SETUP_$2.CHL.JPG /home/kosc/img/$1/6/CHL/$xPos-$yPos.JPG
            convert -crop 100x100+$startX+$startY /home/dev/ori/RGB/$1/SETUP_$2.RGB.JPG /home/kosc/img/$1/6/RGB/$xPos-$yPos.JPG
            xPos=`expr $xPos + 1`
        done
        yPos=`expr $yPos + 1`
        echo ""
    done
}
getYear
yy=$?
getMonth
mm=$?
getDay
dd=$?
getHour
hh=$?


make_dir $yy $mm $dd $hh
setup $yy $mm $dd $hh
make_6_img $1 $2
make_12_img $1 $2
make_25_img $1 $2
make_50_img $1 $2

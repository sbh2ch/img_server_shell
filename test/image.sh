#!/bin/bash

testee(){
    echo "current date is $(date +%Y-%m-%d)"
    echo "current time is $(date +%H:%M:%S)"
}

make_dir(){
    cnt=3
    while [ $cnt -lt 7 ]
    do  
      echo "$cnt mk dir!"
      mkdir -p /home/kosc/img/$1/$cnt/CDOM
      mkdir -p /home/kosc/img/$1/$cnt/TSS
      mkdir -p /home/kosc/img/$1/$cnt/CHL
      mkdir -p /home/kosc/img/$1/$cnt/RGB    
      cnt=`expr $cnt + 1`
    done
}

setup(){
    cdom=`find /home/dev/ori/CDOM/$1 -name COMS_GOCI_L2A_GA_$2????.CDOM.BI.JPG`
    convert -crop 5000x5000+300+300 $cdom /home/dev/ori/CDOM/$1/SETUP_$2.CDOM.JPG

    tss=`find /home/dev/ori/TSS/$1 -name COMS_GOCI_L2A_GA_$2????.TSS.BI.JPG`
    convert -crop 5000x5000+300+300 $tss /home/dev/ori/TSS/$1/SETUP_$2.TSS.JPG

    chl=`find /home/dev/ori/CHL/$1 -name COMS_GOCI_L2A_GA_$2????.CHL.BI.JPG`
    convert -crop 5000x5000+300+300 $chl /home/dev/ori/CHL/$1/SETUP_$2.CHL.JPG

    rgb=`find /home/dev/ori/RGB/$1 -name COMS_GOCI_BI_$2????.JPG`
    convert -crop 5000x5000+300+300 $rgb /home/dev/ori/RGB/$1/SETUP_$2.RGB.JPG
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



make_25_img(){
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



make_50_img(){
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


make_dir $1
setup $1 $2
make_66_img $1 $2


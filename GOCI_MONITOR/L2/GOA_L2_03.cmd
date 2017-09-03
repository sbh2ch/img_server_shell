@echo off

title GOA L2 - img, he5

for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A&SET MM=%%B&SET DD=%%C)
for /f "tokens=1-3 delims=: " %%A in ('echo %TIME%') do (set NHH=%%A&SET MIN=%%B&SET SS=%%C)


Set HH=03

echo. >> dms%HH%.dat
del dms%HH%.dat
echo open 222.222.222.222>> dms%HH%.dat
echo id>> dms%HH%.dat
echo pw>> dms%HH%.dat
echo binary>> dms%HH%.dat
echo cd /nfsgdps/GOCI/data/dbdata>> dms%HH%.dat

echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.CDOM.BI.JPG>> dms%HH%.dat
echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.CHL.BI.JPG>> dms%HH%.dat
echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.TSS.BI.JPG>> dms%HH%.dat
echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.CHL.he5>> dms%HH%.dat
echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.TSS.he5>> dms%HH%.dat
echo mget COMS_GOCI_L2A_GA_%YY%%MM%%DD%%HH%????.CDOM.he5>> dms%HH%.dat
echo close>> dms%HH%.dat
echo quit>> dms%HH%.dat
ftp -s:dms%HH%.dat -i

Set TYPE=CDOM

:L2makeloof_

dir COMS_GOCI_L2A_GA_%YY%%MM%%DD%??????.%TYPE%.BI.JPG /b> temp%HH%.dat
for /f "delims=" %%A in (temp%HH%.dat) do (set FN=%%A)
echo %FN%
set FYY=%FN:~17,4%
set FMM=%FN:~21,2%
set FDD=%FN:~23,2%
set FHH=%FN:~25,2%
set FMIN=%FN:~27,2%
set FSS=%FN:~29,2%
echo %FYY%-%FMM%-%FDD%-%FHH%-%FMIN%-%FSS%

if exist COMS_GOCI_L2A_GA_%YY%%MM%%DD%%FHH%%FMIN%%FSS%.%TYPE%.BI.JPG goto makeL2_


:makeL2_

ren COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%%FMIN%%FSS%.%TYPE%.BI.JPG COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%.%TYPE%.BI.JPG
ren COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%%FMIN%%FSS%.%TYPE%.he5 COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%.%TYPE%.he5

ncftpput.exe -m -U 000 -u id -p pw 222.222.222.222 /GOA/%FYY%/%FMM%/%FDD%/%FHH% COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%.%TYPE%.BI.JPG
ncftpput.exe -m -U 000 -u id -p pw 222.222.222.222 ../dev/ori/%TYPE%/%FYY%/%FMM%/%FDD%/%FHH% COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%.%TYPE%.BI.JPG
ncftpput.exe -m -U 000 -u id -p pw 222.222.222.222 /GOA/%FYY%/%FMM%/%FDD%/%FHH% COMS_GOCI_L2A_GA_%FYY%%FMM%%FDD%%FHH%.%TYPE%.he5

del COMS_GOCI_L2A_GA_%YY%%MM%%DD%%FHH%.%TYPE%.he5
del COMS_GOCI_L2A_GA_%YY%%MM%%DD%%FHH%.%TYPE%.BI.JPG

:nextype_
if %TYPE% EQU TSS goto end_
if %TYPE% EQU CHL Set TYPE=TSS
if %TYPE% EQU CDOM Set TYPE=CHL

goto L2makeloof_

:end_

del *.JPG
del *.he5


echo The end
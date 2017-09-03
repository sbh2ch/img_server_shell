#!usr/bin/perl
use strict;
use warnings;

# ���û���� L2 �ڷḦ ������ ����
# 11��~18�� �Žð� 0 ~ 5��, 20 ~ 25�п� 
# C:\environment\command[hour].bat�� ����

# set parameters
my $WORK_DIR=""; #���� EnvironmentsDailyRun.pl�� ���ư��� ���丮
my $SOURCE_DIR="C:\\GDDS1\\GOCI_MONITOR\\L2"; 


sub PrintTime(){

	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	printf("%04d.", $year + 1900);
	printf("%02d.", $mon + 1);
	printf("%02d-", $mday);
	printf("%02d:", $hour);
	printf("%02d:", $min);
	printf("%02d\n", $sec);
	
}

sub GetYear(){
	
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	return $year + 1900;	
}

sub GetMonth(){
	
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	my $month = $mon + 1;
	
	if( $month < 10 )
	{
		return "0".$month;	
	}
	else
	{
		return $month;	
	}
}	

sub GetDay(){
	
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;

	if( $mday < 10 )
	{
		return "0".$mday;	
	}
	else
	{
		return $mday;	
	}
}

sub GetHour(){
	
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	return "0".$hour;	
}

sub GetMinute(){
	
	my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	return $min;	
}

while(1)
{

	# command[hour].bat ����
	if( ( &GetMinute() >= 13  && &GetMinute() <= 18))
	{

		if( &GetHour() == 11 )
		{
			system("$SOURCE_DIR\\GOA_L2_00.cmd");
		}
		elsif( &GetHour() == 12 )
		{
			system("$SOURCE_DIR\\GOA_L2_01.cmd");
		}
		elsif( &GetHour() == 13 )
		{
			system("$SOURCE_DIR\\GOA_L2_02.cmd");	
		}
		elsif( &GetHour() == 14 )
		{
			system("$SOURCE_DIR\\GOA_L2_03.cmd");	
		}
		elsif( &GetHour() == 15 )
		{
			system("$SOURCE_DIR\\GOA_L2_04.cmd");	
		}
		elsif( &GetHour() == 16 )
		{
			system("$SOURCE_DIR\\GOA_L2_05.cmd");	
		}
		elsif( &GetHour() == 17 )
		{
			system("$SOURCE_DIR\\GOA_L2_06.cmd");	
		}
		elsif( &GetHour() == 18 )
		{
			system("$SOURCE_DIR\\GOA_L2_07.cmd");	
		}

	}	

	PrintTime();
	print "Sleep...\n";
	system("ping 1.1.1.1 -n 1 -w 300000 > NUL"); #5��
}

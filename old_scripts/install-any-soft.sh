#!/bin/bash
################################
#Purpose: To Install any Package
#Version: 1.0
#Owner 	: Kapil <kapil0123@gmail.com>
#Input	: None
#Output	: None
################################

ISROOT=`/bin/whoami`
if [ "$ISROOT" != "root" ];then
echo "you must be root user to install"
exit
fi

#install Funtion

install()
{
        echo "Enter the Package you want to install"
        read PACK
	rpm -q $PACK
        if [ `echo $?` -eq 0 ]; then
        echo "$PACK is ALREADY installed!!!"

        else
        echo "###########Installing $PACK ...#################"
        sudo yum -y install $PACK
	echo "##########installing $PACK completed############# "
	fi
}

install
######To add deleted files to Staging Dir #####
# git add --all .

######To Debug a Script #######
#while running use bash -xv script-name
#set -x : Display commands and their arguments as they are executed.
#set -v : Display shell input lines as they are read.

######things not working #######
#if [ `rpm -qa tree` -eq "0" ];

#rpm -qa $PACK # as if you query all rpm is always successful

##########Info about Vi VISUAL BLOCK MODE ########
#Press Esc to enter 'command mode'
#Use Ctrl+V to enter visual block mode
#Move Up/Downto select the columns of text in the lines you want to comment.
#Then hit Shift+i and type the text you want to insert.
#Then hit Esc, wait 1 second and the inserted text will appear on every line

##########Error resolved##############
#Error :

#[root@localhost ~]# yum install xorg-x11-font*
#Loaded plugins: fastestmirror, refresh-packagekit, security
#Existing lock /var/run/yum.pid: another copy is running as pid 2600.
#Another app is currently holding the yum lock; waiting for it to exit…
#The other application is: yum
#Memory : 21 M RSS (1.2 GB VSZ)
#Started: Mon Oct 14 12:19:29 2013 – 08:47 ago
#State : Sleeping, pid: 2600

#First i attempt to kill the process
# kill -9 2600
#the process could not be stopped

#Second i attempt to kill all yum process
# killall -9 yum

#still the process could not be stopped
#then i shutdown my server and switched on again and still the same result.

#finally i remove the yum.pid 2600
#after this yum started working fine.
#Final solution if you fail to stop the process :
# rm -f /var/run/yum.pid 2600

#then update your yum
# yum -y update
#Make sure that yum-updatesd is started :
# /etc/init.d/yum-updatesd status
# /etc/init.d/yum-updatesd start


Java()
{
	java -version
	
	if [ $? = 0 ]
		then 
		echo "=========================="
		echo "java is already installed "
		echo "=========================="
		else
		
		 echo 'Java Installation start)'
	    echo '-----------------------'
		cd /opt
		sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm
		sudo yum install jdk-8u181-linux-x64.rpm -y
		echo "export JAVA_HOME=/usr/java/jdk1.8.0_181-amd64" >> /etc/bashrc
        text='export PATH=$PATH:$JAVA_HOME/bin'
        echo "$text" >> /etc/bashrc
        source /etc/bashrc
        echo
        echo "===================="
		echo "JAVA-VERSION"
		echo "===================="
		java -version
		echo 'Java Installation done successfully.)'
	    echo '-----------------------------------'
	fi	
}	

NexusRun()
{
cd /opt/nexus-nexus/bin
sh nexus run
}

NexusStart()
{
cd /opt/nexus-nexus/bin
sh nexus start
}
NexusStop()
{
cd /opt/nexus-nexus/bin
sh nexus stop
}
NexusRestart()
{
cd /opt/nexus-nexus/bin
sh nexus restart
}
NexusStatus()
{
cd /opt/nexus-nexus/bin
sh nexus status
}
NexusUninstall()
{
cd /opt
rm -rf nexus-nexus
rm -rf nexus.zip 
rm -rf sonatype-work
}

Nexus()
 {
	if [ -e /opt/nexus-nexus ]
	then 
	echo
	echo "==========================="
	echo " Nexus is already installed "
	echo "==========================="
	else
	yum install wget -y
	yum install unzip -y
	Java
	cd /opt
	echo "Nexus Downloading"
			wget https://github.com/Yphanikumar5/nexus/archive/nexus.zip
			unzip nexus.zip
	fi
 }
 echo "Slect a Option "
	echo " 1. Install Nexus "
	echo " 2. Start the Nexus "
	echo " 3. Run the Nexus"
	echo " 4. Stop the Nexus"
	echo " 5. Status of the Nexus"
	echo " 6. Restart the Nexus "
	echo " 7. Uninstall the Nexus "
	echo " Enter a Number "
	read ne
	case $ne in
	1)
		Nexus
		;;
	2)
		NexusStart
		;;
	3)
		 NexusRun
		;;
	4)
		NexusStop
		;;
	5)
		NexusStatus
		;;
	6)
		NexusRestart
		;;
	7)
		NexusUninstall
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac
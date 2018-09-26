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

Jfrog()
 {
	if [ -e /opt/jfrog-jfrog ]
	then 
	echo
	echo "==========================="
	echo " jfrog is already installed "
	echo "==========================="
	else
	Java
	cd /opt
	echo "JFrog Downloading"
			wget https://github.com/Yphanikumar5/jfrog/archive/jfrog.zip
			unzip jfrog.zip
			cd jfrog-jfrog/bin
			sh installService.sh
	fi
 }
 JfrogUninstall()
 {
	cd /opt
	rm -rf jfrog.zip
	rm -rf jfrog-jfrog
 }
 echo "Slect a Option "
	echo " 1. Install Jfrog "
	echo " 2. Start the Jfrog "
	echo " 3. Stop the Jfrog"
	echo " 4. Status of the Jfrog"
	echo " 5. Restart the Jfrog "
	echo " 6. Uninstall the Jfrog "
	echo " Enter a Number "
	read jf
	case $jf in
	1)
		Jfrog
		;;
	2)
		service artifactory start
		;;
	
	3)
		service artifactory stop
		;;
	4)
		service artifactory status
		;;
	5)
		service artifactory restart
		;;
	6)
		JfrogUninstall
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac
 

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
		yum install wget -y
		yum install unzip -y
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

Jenkins()
	{
		service jenkins status
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Jenkins is already installed "
		echo "============================="
		else
		echo " installing the jenkins "
		yum install wget -y
		yum install unzip -y
		Java
		wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
		rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
		yum install jenkins -y
		systemctl start jenkins
		systemctl enable jenkins
		firewall-cmd --zone=public --add-port=8080/tcp --permanent
		firewall-cmd --zone=public --add-service=http --permanent
		firewall-cmd --reload
		fi
	}
	
	echo "Slect a Option "
	echo " 1. Install Jenkins "
	echo " 2. Start the Jenkins "
	echo " 3. Stop the Jenkins"
	echo " 4. Status of the Jenkins"
	echo " 5. Restart Jenkins"
	echo " 6. Uninstall Jenkins "
	echo " Enter a Number "
	read jen
	case $jen in
	1)	
		
		Jenkins
		;;
	2)
		 service jenkins start
		;;
	3)
		 service jenkins stop
		;;
	4)
		 service jenkins status
		;;
	5)
		service jenkins restart
		;;
	6)
		service jenkins stop
		yum remove jenkins -y
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac
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
Maven()
	{
		mvn -version
		if [ $? = 0 ]
			then 
			echo "==========================="
			echo "Maven is already installed "
			echo "==========================="
			else
			Java
			cd /opt
			echo "MAVEN Downloading"
            wget http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip -O apache-maven-3.5.4.zip
            unzip apache-maven-3.5.4.zip
	    	echo "export M2_HOME=/opt/apache-maven-3.5.4" >> /etc/bashrc
	    	text='export PATH=$PATH:$M2_HOME/bin'
            echo "$text" >> /etc/bashrc
            source /etc/bashrc
            echo
            echo "===================="
			echo "MAVEN-VERSION"
			echo "===================="
			mvn -version
			fi
	}	
MavenUninstall()
	{
		cd /opt
		rm -rf apache-maven-3.5.4.zip
		rm -rf apache-maven-3.5.4
	}
	echo "Slect a Option "
	echo " 1. Install Maven "
	echo " 2. Uninstall Maven "
	echo " 3. Maven Version "
	echo " Enter a Number "
	read gr
	case $gr in
	1)	
		
		Maven
		;;
	2)
		MavenUninstall
		;;
	3)
		echo
		echo "===================="
		echo "Maven-VERSION"
		echo "===================="
		source /etc/bashrc
		mvn -version
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
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
Ant()
	{
		ant -version
		if [ $? = 0 ]
		then 
		echo "========================="
		echo "Ant is already installed "
		echo "========================="
		else 
		Java
		cd /opt
			echo "ANT Downloading"
	    	wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.10.5-bin.zip -O apache-ant-1.10.5.zip
	    	unzip apache-ant-1.10.5.zip
	    	echo "export ANT_HOME=/opt/apache-ant-1.10.5" >> /etc/bashrc
	    	text='export PATH=$PATH:$ANT_HOME/bin'
            echo "$text" >> /etc/bashrc
            source /etc/bashrc
            echo
            echo "===================="
			echo "ANT-VERSION"
			echo "===================="
			ant -version
			fi
	}
	AntUninstall()
	{
		cd /opt
		rm -rf apache-ant-1.10.5.zip
		rm -rf apache-ant-1.10.5
	}
	
	echo "Slect a Option "
	echo " 1. Install Ant "
	echo " 2. Uninstall Ant "
	echo " 3. Ant Version "
	echo " Enter a Number "
	read gr
	case $gr in
	1)	
		
		Ant
		;;
	2)
		AntUninstall
		;;
	3)
		echo
		echo "===================="
		echo "Ant-VERSION"
		echo "===================="
		source /etc/bashrc
		ant -version
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
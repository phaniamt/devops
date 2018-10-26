

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
		sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.rpm
		sudo yum install jdk-8u191-linux-x64.rpm -y
		echo "export JAVA_HOME=/usr/java/jdk1.8.0_191-amd64" >> /etc/bashrc
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
JavaUninstall()
{
	yum remove java -y
}
JavaVersion()
{
	echo
	echo "===================="
	echo "JAVA-VERSION"
	echo "===================="
	java -version
	
}

echo "Slect a Option "
	echo " 1. Install Java "
	echo " 2. Check Java Version "
	echo " 3. Uninstall Java"
	echo " Enter a Number "
	read jav
	case $jav in
	1)
		Java
		;;
	2)
		JavaVersion
		;;
	3)
		 JavaUninstall
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac

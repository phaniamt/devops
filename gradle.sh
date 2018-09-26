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


Gradle()
		{
			gradle -v
			if [ $? = 0 ]
		then
		echo
		echo "========================="
		echo " Git is already installed "
		echo "========================="
		else
		 echo 'Git Installation started.)'
		echo '-------------------------'
		Java
		cd /opt
			echo "Gradle is Downloading"
			wget https://services.gradle.org/distributions/gradle-4.10.2-all.zip
			unzip gradle-4.10.2-all.zip
			echo "export GRADLE_HOME=/opt/gradle-4.10.2" >> /etc/bashrc
	    	text='export PATH=$PATH:$GRADLE_HOME/bin'
            echo "$text" >> /etc/bashrc
            source /etc/bashrc
            echo
            echo "===================="
			echo "GRADLE-VERSION"
			echo "===================="
			gradle -v
			fi
			
			
		}
GradleUninstall()
	{
		cd /opt
		rm -rf gradle-4.10.2-all.zip
		rm -rf gradle-4.10.2
	}
	
	echo "Slect a Option "
	echo " 1. Install Gradle "
	echo " 2. Uninstall Gradle "
	echo " 3. Gradle Version "
	echo " Enter a Number "
	read gr
	case $gr in
	1)	
		
		Gradle
		;;
	2)
		GradleUninstall
		;;
	3)
		echo
		echo "===================="
		echo "Gradle-VERSION"
		echo "===================="
		source /etc/bashrc
		gradle -v
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
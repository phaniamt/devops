
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
	TomcatUninstall()
	{
	 cd /opt/
	sudo rm -rf apache-tomcat-9.0.14
	sudo rm -rf apache-tomcat-9.0.14.zip
	}

	TomcatOutAccess()
	{
		cd /opt/apache-tomcat-9.0.14/webapps/host-manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
		cd /opt/apache-tomcat-9.0.14/webapps/manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
	}
		AddTomcatUser()
	{
		cd /opt/apache-tomcat-9.0.14/conf
		echo "enter the user name"
		read user
		echo "enter the password"
		read password

		sed -i "44i <user username=\"$user\" password=\"$password\" roles=\"admin-gui,manager-gui,manager-script\"/> " tomcat-users.xml
		echo "User Added Successfully Please Restart the Tomcat"
	}
TomcatVersion()
	{
		cd /opt/apache-tomcat-9.0.12
		java -cp lib/catalina.jar org.apache.catalina.util.ServerInfo
	}
TomcatUp()
	{
	echo " Tomcat Starting "
	sh /opt/apache-tomcat-9.0.12/bin/startup.sh
	}
TomcatDown()
	{
	 echo " Tomcat Stopping "
	sh /opt/apache-tomcat-9.0.12/bin/shutdown.sh
	}
TomcatPort()
	{
		cat -n /opt/apache-tomcat-9.0.12/conf/server.xml | sed '69!d'
	}
Tomcat()
	{	
		if [ -e /opt/apache-tomcat-9.0.12 ]
			then
			echo
			echo "=========================="
			echo " tomcat already installed "
			echo "=========================="
			else
			yum install wget -y
			yum install unzip -y
		Java
		cd /opt
		echo "Tomcat Downloading"
            wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.zip
            unzip apache-tomcat-9.0.14.zip
			chmod -R 777 apache-tomcat-9.0.14
			TomcatOutAccess
		fi
	}
echo "Slect a Option "
	echo " 1. Install Tomcat "
	echo " 2. TomacatVersion "
	echo " 3. Add User to Tomcat"
	echo " 4. Start Tomcat "
	echo " 5. Stop Tomcat "
	echo " 6. Restart Tomcat "
	echo " 7. Check Connecter Port"
	echo " 8. Uninstall Tomcat"
	echo " Enter a Number "
	read tom
	case $tom in
	1)
		Tomcat
		
		;;
	2)
		TomcatVersion
		;;
	3)
		AddTomcatUser
		;;
	4)
		TomcatUp
		;;
	5)
		TomcatDown
		;;
	6) TomcatDown
	   TomcatUp
	   echo " Tomcat Restarted "
	   ;;
	 7)TomcatPort
		;;
	8)
	TomcatUninstall
	 ;;

	*)
	echo " Please Enter a valid Number "
	;;
	esac
	


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

Wildfly()
	{	
		if [ -e /opt/wildfly-13.0.0.Final ]
			then 
			echo
			echo "============================="
			echo " Wildfly is already installed "
			echo "============================="
			else
		Java
		cd /opt
		echo "WildFly Downloading"
            wget http://download.jboss.org/wildfly/13.0.0.Final/wildfly-13.0.0.Final.tar.gz
            tar -zxvf wildfly-13.0.0.Final.tar.gz
			fi
	}
WildFlyUninstall()
{
	cd/opt
	rm -rf wildfly-13.0.0.Final
	rm -rf wildfly-13.0.0.Final.tar.gz
}
WildFlyVersion()
{
sh /opt/wildfly-13.0.0.Final/bin/standalone.sh --version
}
WildFlyStart()
{
 sh /opt/wildfly-13.0.0.Final/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0
 }
 WildFlyStop()
 {
  sh /opt/wildfly-13.0.0.Final/bin/jboss-cli.sh --connect command=:shutdown
}
WildFlyAddUser()
{
	sh /opt/wildfly-13.0.0.Final/bin/add-user.sh
}
WildFlyPort()
  {
  cat -n /opt/wildfly-13.0.0.Final/standalone/configuration/standalone.xml | sed '506!d'
  }


echo "Slect a Option "
	echo " 1. Install WildFly "
	echo " 2. WildFlyVersion "
	echo " 3. Add User to WildFly"
	echo " 4. Start WildFly "
	echo " 5. Stop WildFly "
	echo " 6. Restart WildFly "
	echo " 7. Disply http Port"
	echo " 8. Uninstall WildFly "
	echo " Enter a Number "
	read wild
	case $wild in
	1)
		Wildfly
		
		;;
	2)
		WildFlyVersion
		;;
	3)
		WildFlyAddUser
		;;
	4)
		WildFlyStart
		;;
	5)
		WildFlyStop
		;;
	6) WildFlyStop
	   WildFlyStart
	   echo " WildFly Restarted "
	   ;;
	 7)
		WildFlyPort
		;;
	8)
		WildFlyUninstall
		;;

	*)
	echo " Please Enter a valid Number "
	;;
	esac
  
  
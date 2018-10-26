
Versions()
 {
	source /etc/bashrc

echo
echo "===================="
echo "JAVA-VERSION"
echo "===================="
java -version
echo
echo "===================="
echo "ANT-VERSION"
echo "===================="
ant -version
echo
echo "===================="
echo "MAVEN-VERSION"
echo "===================="
mvn -version
echo
echo "===================="
echo "SONAR-SCANNER-VERSION"
echo "===================="
sonar-scanner -v
echo
echo "===================="
echo "DOCKER-VERSION"
echo "===================="
docker --version
echo
echo "===================="
echo "ANSIBLE-VERSION"
echo "===================="
ansible --version
echo
echo "===================="
echo "GIT-VERSION"
echo "===================="
git --version
echo
echo "===================="
echo "GRADLE-VERSION"
echo "===================="
gradle -v
echo
echo "===================="
echo "TOMCAT-VERSION"
echo "===================="
TomcatVersion
 }

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
		TomcatOutAccess()
	{
		cd /opt/apache-tomcat-9.0.12/webapps/host-manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
		cd /opt/apache-tomcat-9.0.12/webapps/manager/META-INF
		sed -i "19i <!-- " context.xml
		sed -i "22i --> " context.xml
	}
		AddTomcatUser()
	{
		cd /opt/apache-tomcat-9.0.12/conf
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
	TomcatUninstall()
	{
	 cd /opt/
	sudo rm -rf apache-tomcat-9.0.12
	sudo rm -rf apache-tomcat-9.0.12.zip
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
		Java
		cd /opt
		echo "Tomcat Downloading"
            wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.zip
            unzip apache-tomcat-9.0.12.zip
			chmod -R 777 apache-tomcat-9.0.12
			TomcatOutAccess
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
 WildFlyUninstall()
{
	cd/opt
	rm -rf wildfly-13.0.0.Final
	rm -rf wildfly-13.0.0.Final.tar.gz
}
  
 SonarService()
{
	sudo ln -s /home/ec2-user/sonarqube-7.2.1/bin/linux-x86-64/sonar.sh /usr/bin/sonar
	echo " #! /bin/sh " >> /etc/init.d/sonar
	text='/usr/bin/sonar $*'
	echo "$text" >> /etc/init.d/sonar
	sudo chmod 755 /etc/init.d/sonar
}

Sonarscanner()
	{
		sonar-scanner -v
		if [ $? = 0 ]
		then
		echo
		echo "===================================="
		echo " sonar-scanner is already installed "
		echo "===================================="
		else
		Java
		cd /opt
		echo "SONAR-SCANNER Downloading"
            wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip 
            unzip sonar-scanner-cli-3.2.0.1227-linux.zip
	    	echo "export SONAR_SCANNER=/opt/sonar-scanner-3.2.0.1227-linux" >> /etc/bashrc
	    	text='export PATH=$PATH:$SONAR_SCANNER/bin'
            echo "$text" >> /etc/bashrc
            source /etc/bashrc
            echo
            echo "===================="
			echo "SONAR-SCANNER-VERSION"
			echo "===================="
			sonar-scanner -v
		fi
	}
Sonarqube()
	{
		if [ -e /opt/sonarqube-7.2.1 ]
		then 
		echo
		echo "================================"
		echo " Sonarqube is already installed "
		echo "================================"
		else
		Sonarscanner
		Java
		cd /opt
		echo "Sonarqube Downloading"
            wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-7.2.1.zip
            unzip sonarqube-7.2.1.zip
		fi
	}
	SonarUninstall()
{
		cd /home/ec2-user
		rm -rf sonarqube-7.2.1.zip
		cd /opt
		rm -rf sonar-scanner-cli-3.2.0.1227-linux.zip
		rm -rf sonar-scanner-3.2.0.1227-linux
		cd /usr/bin
		rm -rf sonar
		cd /etc/init.d
		rm -rf sonar
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
	Java
	cd /opt
	echo "Nexus Downloading"
			wget https://github.com/Yphanikumar5/nexus/archive/nexus.zip
			unzip nexus.zip
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
	fi
 }
 JfrogUninstall()
 {
	cd /opt
	rm -rf jfrog.zip
	rm -rf jfrog-jfrog
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
	
Docker()
	{
		service docker status
		if [ $? = 0 ]
		then 
		echo
		echo "============================"
		echo " Docker is already installed "
		echo "============================"
		else
		echo 'Docker Installation started.)'
        echo '-----------------------------'
            cd / 

            sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

			sudo yum install -y ftp://bo.mirror.garr.it/1/slc/centos/7.1.1503/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm
			sudo yum install -y yum-utils \
			device-mapper-persistent-data \
			lvm2
			sudo yum-config-manager \
			--add-repo \
			https://download.docker.com/linux/centos/docker-ce.repo
			sudo yum-config-manager --enable docker-ce-edge
			sudo yum-config-manager --enable docker-ce-test
			sudo yum install -y docker-ce
			docker --version

			sudo systemctl status docker
			sudo systemctl start docker

			echo 'Docker Installation done successfully.)'
			echo '---------------------------------------'
			echo
			echo "===================="
			echo "DOCKER-VERSION"
			echo "===================="
			docker --version
			fi
	}
	DockerUninstall()
{
	cd / 

       sudo yum remove docker \
                 docker-client \
                 docker-client-latest \
                 docker-common \
                 docker-latest \
                 docker-latest-logrotate \
                 docker-logrotate \
                 docker-selinux \
                 docker-engine-selinux \
                 docker-engine -y
}
Ansible()
	{
		ansible --version
		if [ $? = 0 ]
		then
		echo
		echo "============================="
		echo " Ansible is already installed "
		echo "============================="
		else
		echo 'Ansible Installation started.)'
		echo '------------------------------'
			cd /

			rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

			yum install ansible -y

			ansible --version

		echo 'Ansible Installation done successfully.)'
		echo '----------------------------------------'
        echo
		echo "===================="
		echo "ANSIBLE-VERSION"
		echo "===================="
		ansible --version
		fi
		
	}
Git()
	{
		git --version
		if [ $? = 0 ]
		then
		echo
		echo "========================="
		echo " Git is already installed "
		echo "========================="
		else
		 echo 'Git Installation started.)'
		echo '-------------------------'

		cd /opt
		yum groupinstall "Development Tools" -y
		yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel -y
		yum install wget -y
		wget https://github.com/git/git/archive/v2.18.0.tar.gz -O git-bash.tar.gz
		tar -zxf git-bash.tar.gz
		cd git-2.18.0
		make configure
		./configure --prefix=/usr/local
		make install
		git --version
		git config --global user.name "yphanikumar"
		git config --global user.email "yphanikumar111@gmail.com"
		git config --list	    
		echo
		echo "===================="
		echo "GIT-VERSION"
		echo "===================="
		git --version

        echo 'Git Installation done successfully.)'
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
	
	
	echo "=================================================="
	echo " Please Enter a number which tool you want install "
	echo "=================================================="
	echo " 0.Check all Versions"
	echo " 1.Install all tools "
	echo " 2.Java "
	echo " 3.Ant "
	echo " 4.Maven"
	echo " 5.Tomcat"
	echo " 6.WildFly"
	echo " 7.Sonarqube "
	echo " 8.Nexus "
	echo " 9.JFrog "
	echo " 10.Jenkins "
	echo " 11.Docker "
	echo " 12.Ansible "
	echo " 13.Git "
	echo " 14.Gradle "
	echo " 15. Uninstall All tools "
	echo "----------------"
	echo " Enter a Number "
	echo "----------------"
	
	
  read TOOLS
  case $TOOLS in
  0)
	Versions
	;;
  1)
	Java
	Ant
	Maven
	Gradle
	Tomcat
	Wildfly
	Sonarqube
	Nexus
	Jfrog
	Jenkins
	Docker
	Ansible
	Git
	echo "==========================================================================================="
	echo " please execute " source /etc/bashrc " command manually after completion of the installion "
	echo "==========================================================================================="
	;;
 2)
	echo "Slect a Option "
	echo " 1. Install Java "
	echo " 2. Check Java Version "
	echo " 3. Uninstall Java"
	echo " Enter a Number "
	read jav
	case $jav in
	1)
		yum install wget -y
		yum install unzip -y
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
	;;
 3)
	echo "Slect a Option "
	echo " 1. Install Ant "
	echo " 2. Uninstall Ant "
	echo " 3. Ant Version "
	echo " Enter a Number "
	read an
	case $an in
	1)	
		yum install wget -y
		yum install unzip -y
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
	;;
 4)
	echo "Slect a Option "
	echo " 1. Install Maven "
	echo " 2. Uninstall Maven "
	echo " 3. Maven Version "
	echo " Enter a Number "
	read mn
	case $mn in
	1)	
		yum install wget -y
		yum install unzip -y
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
	
	;;
 5)
	
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
		yum install wget -y
		yum install unzip -y
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
	
	;;
 6)
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
		yum install wget -y
		yum install unzip -y
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
	;;
 7)
	echo "Slect a Option "
	echo " 1. Install Sonarqube "
	echo " 2. Start the Sonarqube "
	echo " 3. Stop the Sonarqube"
	echo " 4. Status of the Sonarqube"
	echo " 5. Restart Sonarqube"
	echo " 6. Uninstall Sonarqube "
	echo " Enter a Number "
	read qube
	case $qube in
	1)	
		yum install wget -y
		yum install unzip -y
		Sonarqube
		;;
	2)
		cd /home/ec2-user/sonarqube-7.2.1
		sudo rm -rf temp 
		 service sonar start
		;;
	3)
		 service sonar stop
		;;
	4)
		 service sonar status
		;;
	5)
		service sonar restart
		;;
	6)
		SonarUninstall
		;;
	*)
	echo " Please Enter a valid Number "
	;;
	esac
	
	;;
 8)
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
		yum install wget -y
		yum install unzip -y
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
	;;
 9)
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
		yum install wget -y
		yum install unzip -y
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
	;;
 10)
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
		yum install wget -y
		yum install unzip -y
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
	;;
 11)
	echo "Slect a Option "
	echo " 1. Install Docker "
	echo " 2. Start the Docker "
	echo " 3. Stop the Docker"
	echo " 4. Status of the Docker"
	echo " 5. Restart Docker"
	echo " 6. Uninstall Docker "
	echo " 7. Docker Version "
	echo " Enter a Number "
	read doc
	case $doc in
	1)	
		yum install wget -y
		yum install unzip -y
		Docker
		;;
	2)
		 service docker start
		;;
	3)
		 service docker stop
		;;
	4)
		 service docker status
		;;
	5)
		service docker restart
		;;
	6)
		DockerUninstall
		;;
	7)
		echo
		echo "===================="
		echo "DOCKER-VERSION"
		echo "===================="
		docker --version
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
	;;
 12)
	echo "Slect a Option "
	echo " 1. Install Ansible "
	echo " 2. Uninstall Ansible "
	echo " 3. Ansible Version "
	echo " Enter a Number "
	read ans
	case $ans in
	1)	
		yum install wget -y
		yum install unzip -y
		Ansible
		;;
	2)
		yum remove ansible -y
		;;
	3)
		echo
		echo "===================="
		echo "ansible-VERSION"
		echo "===================="
		ansible --version
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
	;;
 13)
	echo "Slect a Option "
	echo " 1. Install git "
	echo " 2. Uninstall git "
	echo " 3. git Version "
	echo " Enter a Number "
	read gi
	case $gi in
	1)	yum install wget -y
		yum install unzip -y		
		Git
		;;
	2)
		yum remove git -y
		;;
	3)
		echo
		echo "===================="
		echo "Git-VERSION"
		echo "===================="
		git --version
		;;
		
	*)
		echo " Please Enter a valid Number "
	;;
	esac
	;;
14)
	echo "Slect a Option "
	echo " 1. Install Gradle "
	echo " 2. Uninstall Gradle "
	echo " 3. Gradle Version "
	echo " Enter a Number "
	read gr
	case $gr in
	1)	
		yum install wget -y
		yum install unzip -y
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
	;;
15)
	echo " Uninstall All tools "
	WildFlyUninstall
	SonarUninstall
	NexusUninstall
	TomcatUninstall
	JavaUninstall
	service jenkins stop
	yum remove jenkins -y
	DockerUninstall
	yum remove ansible -y
	yum remove git -y
	GradleUninstall
	AntUninstall
	MavenUninstall
	JfrogUninstall
	echo " Uninstalled all softwares successfully "
	;;
	
 *)
 echo " Please Enter a valid Number "
 ;;
 esac
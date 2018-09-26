

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
            
			DockerUninstall
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
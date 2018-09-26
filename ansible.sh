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
	echo "Slect a Option "
	echo " 1. Install Ansible "
	echo " 2. Uninstall Ansible "
	echo " 3. Ansible Version "
	echo " Enter a Number "
	read ans
	case $ans in
	1)	
		
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
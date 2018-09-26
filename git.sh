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
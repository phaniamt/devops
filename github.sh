
if [ -e /opt/devops-tools ]
then
cd /opt/devops-tools
sh devopstools.sh
else
yum install wget -y
yum install unzip -y
cd /opt
wget https://github.com/Yphanikumar5/devops/archive/tools.zip
unzip tools.zip
cd /opt/devops-tools
sh devopstools.sh
fi
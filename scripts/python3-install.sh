sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u
python3.6 -V
sudo yum -y install python36u-pip
sudo yum -y install python36u-devel
ln -s /bin/python3.6 /usr/bin/python3
#python3.6 -m venv my_env
#!/bin/bash

case "$1" in
  'centos6' ) version="6" ;;
  'centos7' ) version="7" ;;
  *	    ) echo "Incorrect arg, use 'centos6' or 'centos7'." && exit 1;;
esac

## Install ansible in offical docker image centos 6/7
if [ ${version} == "6" ]; then
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
else
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm 
fi

## Install ansible
yum install ansible1.9 -y
  
## Build on localhost
echo "localhost ansible_connection=local prj_host=centos${version}.local" >> inventory/hosts

## Disable iptables (fail build in docker)
sed -i '/iptables/d' playbook/setup.yml

## Build roles with ansible
ansible-playbook --timeout=60 playbook/setup.yml -t setup

## Test project
curl --silent http://${1}.local/ |grep "Web application ${1}.local is up." || exit 1

exit 0


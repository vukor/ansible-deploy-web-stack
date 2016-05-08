#!/bin/bash

## Install ansible in offical docker image centos:centos6
rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install ansible1.9 -y

## Build on localhost
echo 'localhost ansible_connection=local prj_host=centos6.local' >> inventory/hosts

## Disable iptables (fail build in docker)
sed -i '/iptables/d' playbook/setup.yml

## Build roles with ansible
ansible-playbook --timeout=60 playbook/setup.yml -t setup

## Test project
curl --silent http://centos6.local/ |grep 'Web application centos6.local is up.' || exit 1

exit 0


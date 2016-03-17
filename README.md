ansible-deploy-web-stack
===========

This is Ansible receipts for deploy web application on CentOS 6/7 using:
  * Nginx stable version
  * MySQL for CentOS 6 or MariaDB for CentOS 7
  * PHP from Remi repo (avalable version - 5.4, 5.5, 5.6)
  * Postfix


How it's work
===========

* Download project:

    `` git clone https://github.com/vukor/ansible-deploy-web-stack ``

* Install ansible version 1.9

* Set hostname or ip of your server in inventory/hosts. You have to setup the public-key SSH authentication on your server.

* Configure inventory/group_vars/all.yml

* Put your SSL certificate and private key to playbook/roles/nginx/files/ssl/{{ prj_host }}.crt nginx/files/ssl/{{ prj_host }}.key
  
* Deploy web application:

  `` ansible-playbook playbook/setup.yml -t setup ``

* Uninstall all (ATTENTION - it's delete all your data and soft):
  
  `` ansible-playbook playbook/clean.yml -t clean ``

* Run on server, press 'Y' always and set root password from variable mysql_root_password located in inventory/group_vars/all.yml:

  `` mysql_secure_installation `` 

* Go to http://server/
  

In plans
===========

* Automate script mysql_secure_installation in Ansible: drop db test, users, set password for root
* Set password for {{ prj_user }} in inventory/group_vars/all.yml
* Add roles rsnapshot and holland
* Add dkim feature
* Add zabbix role with ztc plugins - https://xakep.ru/2014/08/13/using-zabbix/


Useful links
============
  - https://www.ansible.com
  - http://rpms.famillecollet.com


The MIT License (MIT)
===========
Copyright (c) 2016 Anton Bugreev <anton@bugreev.ru>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  - заполнить all.yml
  - положить сертификат и ключ в nginx/files/ssl/{{ prj_host }}.crt nginx/files/ssl/{{ prj_host }}.key
  
  
  ** Удаление конфигурации сайта и файлов сайта: **
  
  `` ansible-playbook -v playbook/site.yml -t clean ``
  
  `` ansible-playbook -v playbook/site.yml -t service ``
  
  
  Сделать:
  добавить makefile для shortcut'ов ansible-playbook
  

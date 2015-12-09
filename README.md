  - заполнить all.yml
  - положить сертификат и ключ в nginx/files/ssl/{{ prj_host }}.crt nginx/files/ssl/{{ prj_host }}.key
  
  добавить clean - удаление конфигов, сайтов и т.п.
  добавить makefile для shortcut'ов ansible-playbook
  

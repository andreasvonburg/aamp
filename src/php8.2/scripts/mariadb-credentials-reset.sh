mysql -u  root -e "RENAME USER 'root'@'localhost' TO 'root'@'%'"
mysql -u  root -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('')"
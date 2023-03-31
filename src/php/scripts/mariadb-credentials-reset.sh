mysql -u  root -e "CREATE USER IF NOT EXISTS 'root'@'%';"
mysql -u  root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"
mysql -u  root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('')"
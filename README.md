# hikerApp
A Database Management System for Hikers and Tour Guides to connect

to create an sql file that recreates the entire database run the following command in CMD (you will be prompted for the password to the localhost)

mysqldump -u root -p hiker_app > hiker_db_maker.sql

If mysqldump is not recognized as a command, find where your mysql workbench is installed so that cmd knows where to find the exe (refer to reference below)
"C:\Program Files\MySQL\MySQL Workbench 8.0\mysqldump.exe" -u root -p hiker_app > hiker_db_maker.sql

the resulting hiker_db_maker.sql file appears in the directory your called cmd in


-- restauration point (tap in line cmd)
mysqldump -u root -p tuto > file.sql
    -- or (for sur encoding UTF8)
mysqldump -u root -p tuto --result-file=file.sql

-- restaure db 
mysql -u root -p tuto < file.sql




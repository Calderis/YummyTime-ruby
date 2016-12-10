docker run -e MYSQL_ROOT_PASSWORD=hetic123 --name mysql -v /home/mysql/:/var/lib/mysql/ -d mysql

docker run --name phpmyadmin -d --link mysql:mysql -p 8080:80 nazarpc/phpmyadmin

docker run --name web -v ~/YummyTime:/YummyTime --link mysql:mysql -p 3001:3001 -it -d ruby /bin/bash
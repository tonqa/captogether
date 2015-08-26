# captogether

This repository contains the Captogether Backend for the AngularJS workshop based on Mule ESB

## Setup Standalone Mule Runtime and MySQL (for deployment)

1. Download and install MySQL server & workbench 6.3 CE ([Go here](https://www.mysql.de/downloads/) > MySQL Community Edition > MySQL Community Server > MySQL Installer MSI)
1. Open MySQL workbench and create a MySQL user like described [here](https://dev.mysql.com/doc/refman/5.1/en/adding-users.html)
1. Open MySQL workbench and create a MySQL schema (Right click on Tables) and a MySQL 'events' table (see script at {repo}/src/main/resources/create_table.sql)
1. Download Mule Runtime 3.6.1 CE ([Go here](https://developer.mulesoft.com/download-mule-esb-runtime) and then see older "Older Versions", Download and extract ZIP)
1. Start Mule Runtime and deploy '{repo}/artifacts/api.zip' (described [here](https://developer.mulesoft.com/docs/display/current/Walkthrough+Deploy+to+Runtime))
1. Then correct the MySQL database settings for your local MySQL ({mule_folder}/apps/api/application.properties) and restart Mule ESB
1. You should finally open "http://localhost:8081/api/console/" to find out if the backened works

## Alternatively you can also install the Standalone Mule Runtime and MySQL with Docker (for deployment), this is much less error prone..

Download this repository content into a folder (you can use "Download as zip" on the right side of the Github project page)

Install boot2docker, installation comes with Docker, boot2docker is only needed when you are on windows, then start boot2docker 

	boot2docker.exe up

Start MySQL Server Docker Image

	docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:latest

Start a Docker Image with MySQL Client (on Windows please execute this on Powershell, cmd-shell won't work..)

	docker run -it --link mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

Inside MySQL Client do this

	CREATE USER 'user'@'%' IDENTIFIED BY 'password';

	GRANT ALL PRIVILEGES ON * . * TO 'user'@'%';

	FLUSH PRIVILEGES;

	CREATE DATABASE eventdb;

	USE eventdb;

	CREATE TABLE `events` (`id` int(11) NOT NULL AUTO_INCREMENT, `title` varchar(45) NOT NULL, `category` varchar(45) NOT NULL, `participants` int(11) NOT NULL DEFAULT '1', `country` varchar(45) DEFAULT NULL, `description` varchar(45) DEFAULT NULL, `street` varchar(45) DEFAULT NULL, `streetnr` int(11) DEFAULT NULL, `zipcode` varchar(5) DEFAULT NULL, `date` varchar(11) NOT NULL, `city` varchar(45) DEFAULT NULL, `geolocation` varchar(45) DEFAULT NULL, PRIMARY KEY (`title`,`date`), UNIQUE KEY `id_UNIQUE` (`id`), UNIQUE KEY `key_UNIQUE` (`title`,`date`)) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

	quit;

Repackage the {projectdir}/artifacts/api.zip with the following application.properties values

	app.host=0.0.0.0
	app.port=8081
	db.mysql.url=jdbc:mysql://mysql:3306/eventdb?user=user&password=password

__Important: Also make sure to open the port 8081 on your Docker-VM-Image (on Windows this is the boot2docker-Image hosted by Virtualbox).__

Run the application

	cd C:\projectdir

	docker build -t tonqa/mule .

	docker run -name mule -p 8888:8888 -p 8081:8081 -v '/c/projectdir/artifacts:/opt/mule/apps' -v '/c/projectdir/log:/opt/mule/logs' -link mysqlserver:mysql -d tonqa/mule

You can now open http://localhost:8081/api/console/ in your local browser

If the Mule needs to be stopped do the following

	docker stop mule; docker rm mule;

If you want to stop the MySQL do the following

	docker stop mysql; docker rm mysql;

## Setup Anypoint Studio development environment (for development)

1. Check out the project repository
1. Download and install Anypoint Studio 
1. Import project (File > Import > Anypoint Studio project from external location)

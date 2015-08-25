# captogether

This repository contains the Capgemini Workshop Backend for the AngularJS workshop

## Setup with Standalone Mule Runtime

1. Download and install MySQL server & workbench 6.3 CE ([Go here](https://www.mysql.de/downloads/) > MySQL Community Edition > MySQL Community Server > MySQL Installer MSI)
1. Open MySQL workbench and create a MySQL user like described [here](https://dev.mysql.com/doc/refman/5.1/en/adding-users.html)
1. Open MySQL workbench and create a MySQL schema (Right click on Tables) and a MySQL 'events' table (see script src/main/resources/create_table.sql)
1. Download Mule Runtime 3.6.1 CE ([Go here](https://developer.mulesoft.com/download-mule-esb-runtime) and then see older "Older Versions", Download and extract ZIP)
1. Start and Mule Runtime and deploy 'artifacts/api.zip' (described [here](https://developer.mulesoft.com/docs/display/current/Walkthrough+Deploy+to+Runtime))
1. Then setup the local MySQL database settings (<mule_folder>/apps/api/application.properties) and restart Mule ESB

## Open sources with Anypoint Studio

1. Checkout whole project repository
1. Download and install Anypoint Studio 
1. Import project (File > Import > Anypoint Studio project from external location)

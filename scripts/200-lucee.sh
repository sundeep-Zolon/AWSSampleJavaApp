#!/bin/bash

#configuration options
yum -y install httpd mysql-server
wget https://s3.amazonaws.com/psych-select-infrastructure/lucee-4.5.2.018-pl0-linux-x64-installer.run
chmod +x lucee-4.5.2.018-pl0-linux-x64-installer.run
./lucee-4.5.2.018-pl0-linux-x64-installer.run --mode unattended --railopass 123456
yum -y remove httpd
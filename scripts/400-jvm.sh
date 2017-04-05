#!/bin/bash

#set these two variables if you want to use an oracle JVM, instead of openjdk
export JVM_FILE="server-jre-8u66-linux-x64.tar.gz"
export JVM_VERSION="1.8.0_66"

echo "Installing Oracle JVM"
if [ -f $JVM_FILE ];
then
  mkdir /opt/lucee/jvm
  tar -xf $JVM_FILE -C /opt/lucee/jvm
  chown -R root:root /opt/lucee/jvm
  chmod -R 755 /opt/lucee/jvm
  ln -s /opt/lucee/jvm/jdk$JVM_VERSION /opt/lucee/jvm/current
  echo $'\nJAVA_HOME="/opt/lucee/jvm/current"' >> /etc/tomcat8/tomcat8.conf
else
  echo "File $JVM_FILE not found, SKIPPING Oracle JVM Installation"
fi

echo "Tomcat / Lucee Configuration Done, Restarting Tomcat"
service tomcat8 stop
service tomcat8 start

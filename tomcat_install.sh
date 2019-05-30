#!/bin/bash 
#pre-req
cd /opt
yum install wget unzip zip  -y 
#downloading java rpm 
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
#install the java 
rpm -ivh jdk-8u131-linux-x64.rpm
rm -f jdk-8u131-linux-x64.rpm
#tomcat download 
wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20-windows-x64.zip
#install tomcat
unzip apache-tomcat-9.0.20-windows-x64.zip
rm -f apache-tomcat-9.0.20-windows-x64.zip
mv apache-tomcat-9.0.20 tomcat9
chmod -R 755 tomcat9
#start tomcat 
rm -f /opt/tomcat9/bin/*.bat
rm -f /opt/tomcat9/bin/*.exe
rm -f /opt/tomcat9/bin/*.dll
#rm -f *.bat *.exe *.dll 
rm -fr /opt/tomcat9/webapps/*
/opt/tomcat9/bin/startup.sh 


#!/bin/bash

## at work, we have request for jenkins installation on centos 7. and to do it ,
## we follow a document. the problem with that is errors and time wasted.
## we need to automate the process using a bash shell script. Go ahead and write ## the script for it
## Below are the steps followed for the installation:
    
sudo yum update -y

sudo yum install wget -y

sudo yum install rpm -y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y

## install And Enable Docker
sudo yum install docker -y
sudo service docker start 
sudo systemctl enable docker.service

sudo chmod 777  /var/run/docker.sock


## install Git
sudo yum install git -y
yum install unzip -y

## Install Java 11:
## sudo amazon-linux-extras install java-openjdk11 -y

sudo yum install java-11* -y
## Install Jenkins then Enable the Jenkins service to start at boot :
sudo yum install jenkins -y
sudo systemctl enable jenkins

## Start Jenkins as a service:
sudo systemctl start jenkins

## Display Initial Jenkins Password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword  

## Take ip to the browser and access it on port 8080 ( example: 198.40.2.78:8080 )
## Once the installation is completed and successful, head to the aws instance and enable port 8080 under ipv4 firewall.
## custom - TCP - 8080 and create.
## copy the ip address and past it in the address bar. e.g
## http://35.173.231.205:8080/

#!/bin/bash

# # # # # # # # # # # # # # # # # # # # #
# JENKINS INSTALL

# INSTALL JAVA

sudo apt install -y openjdk-8-jre openjdk-8-jdk


# INSTALL GIT

sudo apt install -y git


# INSTALL MAVEN

sudo apt install -y maven


# check if a jenkins user already exists


if ! cat /etc/passwd | grep jenkins; then
	# add the jenkins user
	sudo useradd -m -s /bin/bash jenkins
fi


# check if the sudoers file has jenkins in it already

if ! sudo cat /etc/sudoers | grep jenkins; then 
	# make jenkins a sudo user
	echo 'jenkins ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
fi


# download the latest jenkins.war to the jenkins home folder

sudo wget https://updates.jenkins-ci.org/latest/jenkins.war -O /home/jenkins/jenkins.war


# make sure jenkins owns the jenkins.war file

sudo chown jenkins:jenkins /home/jenkins/jenkins.war


# install the jenkins service script

sudo cp jenkins.service /etc/systemd/system/jenkins.service


# reload all of the systemd service scripts

sudo systemctl daemon-reload


# start the jenkins service

sudo systemctl restart jenkins


# # # # # # # # # # # # # # # # # # # # #

### SPRING INSTALL ###

#CREATE USER SPRING
# - make sure the user has a home folder (-m)
# - set the default shell to bash (-s)
# - this is only because sh isnt as easy to use as bash ie (-s)

sudo useradd -m -s /bin/bash spring


#INSTALL JAVA

sudo apt install -y openjdk-8-jre openjdk-8-jdk


#INSTALL GIT

sudo apt install -y git


#INSTALL MAVEN

sudo apt install -y maven


#INSTALL THE SOURCE SCRIPT

sudo cp spring.service /etc/systemd/system

#RELOAD ALL OF THE SYSTEMD SCRIPTS

sudo systemctl daemon-reload




# # # # # # # # # # # # # # # # # # # # #
# PYTHON INSTALL

# INSTALL JAVA

sudo apt install -y openjdk-8-jre openjdk-8-jdk


# INSTALL GIT

sudo apt install -y git


# INSTALL PYTHON

sudo apt install -y python


# check if a python user already exists


if ! cat /etc/passwd | grep python; then
        # add the python user
        sudo useradd -m -s /bin/bash python
fi


# check if the sudoers file has jenkins in it already

if ! sudo cat /etc/sudoers | grep python; then
        # make python a sudo user
        echo 'python ALL=(ALL:ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
fi


# install the python service script

sudo cp python-systemd-http-server.service /etc/systemd/system/python-systemd-http-server.service


# reload all of the systemd service scripts

sudo systemctl daemon-reload

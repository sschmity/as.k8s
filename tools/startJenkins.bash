#!/usr/bin/env bash
docker run -d -v jenkins_home:/var/jenkins_home -p 8888:8080 -p 50000:50000 --name ei050-jenkins jenkins/jenkins:lts

##export jenkins configuration
#cd
#docker cp ei050-jenkins:/var/jenkins_home .
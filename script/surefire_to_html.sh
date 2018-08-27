#!/usr/bin/env bash

#junit html plugin

cd /var/jenkins_home/workspace/simple-maven
/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/maven_3.5.4/bin/mvn surefire-report:report

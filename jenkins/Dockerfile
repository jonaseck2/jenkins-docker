FROM jenkins

USER root

RUN apt-get update -qqy \
 && apt-get install -qqy sudo apparmor \
 && rm -rf /var/lib/apt/lists/* ${JENKINS_HOME}/jobs \
 && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins

COPY jenkins_home usr/share/jenkins/ref
#COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

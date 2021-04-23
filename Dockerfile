FROM ubuntu-python-base
USER root
WORKDIR /project
ADD . /project

RUN pip3 install -r requirements.txt

RUN apt-get update -y

RUN apt install vim -y 

RUN apt install openjdk-11-jdk -y

RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/java 1

RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/javac 1

#I can't make this work, and I don't know why. 
#RUN ["/bin/bash", "-c", "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"]
#RUN ["/bin/bash", "-c", "export PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin:$PATH"]
#ENV 

#------------------------------------------------------------
#* 0            /usr/lib/jvm/java-11-openjdk-amd64/bin/java       1111      auto mode
#  1            /usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/java   1         manual mode
#  2            /usr/lib/jvm/java-11-openjdk-amd64/bin/java       1111      manual mode
#RUN update-alternatives --config java 
RUN update-alternatives --auto java 

#https://stackoverflow.com/questions/27093612/in-a-dockerfile-how-to-update-path-environment-variable
#Don't bother trying to RUN this, it won't work. ENV is the way to go.
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin:$PATH

#RUN  /bin/bash -c "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
#RUN  /bin/bash -c "export PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin:$PATH"
#Run this as bash or it won't work
#RUN /bin/bash -c "source ~/.profile"

#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-neo4j-on-ubuntu-20-04
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y

RUN curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | apt-key add -

RUN add-apt-repository "deb https://debian.neo4j.com stable 4.1"

RUN apt install neo4j -y


#RUN  /bin/bash -c "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
#RUN  /bin/bash -c "export PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin:$PATH"

#RUN service neo4j start
#RUN service neo4j stop

#Copy the configuration over.
#RUN cp ./neo4j.conf /etc/neo4j/
#RUN cat /etc/neo4j/neo4j.conf

#RUN service neo4j start
#RUN curl -H "Content-Type: application/json" -X POST -d '{"password":"fartLAND#123xyz"}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password
#RUN service neo4j stop

#https://stackoverflow.com/questions/52504237/how-to-make-changes-of-neo4j-conf-take-effect

#Instead of starting the process with systemctl find the actual command executed by systemd when running systemctl start servicename by looking for the ExecStart instruction in the unit file of the service. That is the command (you might need to adjust it a bit) which should be set as the CMD instruction in the Dockerfile.

#RUN systemctl enable neo4j.service
#CMD ["systemctl", "enable", "neo4j.service"]
CMD ["service", "neo4j", "start"]
#service neo4j status
#RUN service neo4j status
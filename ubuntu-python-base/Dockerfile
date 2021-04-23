FROM groovy
USER root
RUN apt update
RUN apt install python3-pip -y
#https://linuxize.com/post/how-to-install-pip-on-ubuntu-20.04/
#Not really sure how what do about this.
#https://stackoverflow.com/questions/38613316/how-to-upgrade-pip3
#RUN pip3 install --upgrade pip3
WORKDIR /project
ADD . /project
RUN pip3 install -r requirements.txt

#https://askubuntu.com/questions/320996/how-to-make-python-program-command-execute-python-3
RUN ["/bin/bash", "-c", "echo 'alias python=python3' >> ~/.bash_aliases"]
RUN ["/bin/bash", "-c", "source /root/.bash_aliases"]
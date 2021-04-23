FROM ubuntu-python-base
USER root
WORKDIR /tf
#ADD . /project

RUN apt-get update -y

RUN apt install vim -y 

#https://www.tensorflow.org/install
##https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/cpu-jupyter.Dockerfile

RUN pip3 install --no-cache-dir tensorflow jupyter matplotlib
# Pin ipykernel and nbformat; see https://github.com/ipython/ipykernel/issues/422
RUN pip3 install --no-cache-dir jupyter_http_over_ws ipykernel==5.1.1 nbformat==4.4.0

RUN jupyter serverextension enable --py jupyter_http_over_ws

EXPOSE 8888

RUN python3 -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]
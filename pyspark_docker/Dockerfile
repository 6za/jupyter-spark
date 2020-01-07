FROM 6zar/pyspark
# Source: https://docs.docker.com/install/linux/docker-ce/ubuntu/
RUN apt-get update
RUN apt-get install -y  apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
CMD cd /root && jupyter notebook  --ip=0.0.0.0 --allow-root

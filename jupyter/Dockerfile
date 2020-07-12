FROM ubuntu:bionic
# Install all OS dependencies for fully functional notebook server
RUN export DEBIAN_FRONTEND=noninteractive
ENV TZ America/New_York
ENV DEBIAN_FRONTEND noninteractive
RUN echo "US/Eastern" > /etc/timezone    

RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    wget ca-certificates\
    curl \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    libtool pkg-config autoconf automake \
    tzdata \
    unzip \
    nano \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /usr/local/share/ca-certificates/cacert.org \
    && cd  /usr/local/share/ca-certificates/cacert.org \
    && wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt \
    && update-ca-certificates
    
#https://github.com/MonsieurV/ZeroMQ-RPi    
RUN wget https://github.com/jedisct1/libsodium/releases/download/1.0.3/libsodium-1.0.3.tar.gz \
    && tar -zxvf libsodium-1.0.3.tar.gz \
    && cd libsodium-1.0.3/ \
    && ./configure \
    && make \
    && make install && cd ..
RUN wget https://github.com/zeromq/libzmq/releases/download/v4.3.2/zeromq-4.3.2.tar.gz \
    && tar -zxvf zeromq-4.3.2.tar.gz \
    && cd zeromq-4.3.2/ \
    && ./configure \
    && make \
    && make install \
    && ldconfig && cd ..
RUN apt-get update && apt-get install -yq --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/*    
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -yq --no-install-recommends \
    curl \
    python3.6 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*    
RUN python3 -m pip install --upgrade pip
RUN pip3  install --upgrade setuptools
RUN pip3 install wheel
RUN pip3 install jupyterlab      
RUN pip3 install jupyter
RUN pip3 install h5py
RUN pip3 install matplotlib
# RUN pip3 install scipy-image
# Not working for pip3
RUN pip3 install SQLAlchemy
RUN pip3 install spylon-kernel
RUN cd /tmp && \
    git clone https://github.com/PAIR-code/facets.git && \
    cd facets && \
    jupyter nbextension install facets-dist/ --sys-prefix && \
    cd && \
    rm -rf /tmp/facets
# SERVER: jupyter notebook  --ip=0.0.0.0 --allow-root

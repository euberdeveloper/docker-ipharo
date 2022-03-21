FROM basmalltalk/pharo:9.0-image
USER root

# Update and upgrade apt
RUN apt update && apt upgrade -y

# Install Python 3.9.1
RUN apt install wget build-essential libreadline-gplv2-dev \
    libncursesw5-dev libssl-dev libsqlite3-dev tk-dev \
    libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
    -y && \
    wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz && \
    tar xzf Python-3.9.1.tgz && \
    rm -rf Python-3.9.1.tgz && \
    cd Python-3.9.1 && \
    ./configure --enable-optimizations && \
    make -j 2 && \
    make altinstall

# Install pip 21 and jupyter
RUN apt install python3-pip -y && \
    pip3 install --upgrade pip && \
    pip install jupyter

# Install ZMQ
RUN apt-get install libtool -y && \
    cd /opt && \
    wget https://github.com/zeromq/zeromq4-1/releases/download/v4.1.5/zeromq-4.1.5.tar.gz && \
    tar -xzf zeromq-4.1.5.tar.gz && \
    rm -rf zeromq-4.1.5.tar.gz && \
    cd zeromq-4.1.5 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# Install IPharo
WORKDIR /opt/pharo
RUN ./pharo Pharo.image eval --save "Metacello new \
    baseline:'IPharo'; \
    repository: 'github://jmari/IPharo:master/repository'; \
    load: 'default'"

# Create the notebooks directory
RUN mkdir /notebooks

# Copy launch.sh
COPY launch.sh .

# Declare default envs
ENV ALLOW_ROOT=TRUE
ENV IP=0.0.0.0
ENV NOTEBOOK_DIR=/notebooks
ENV NO_BROWSER=TRUE

# Launch jupyter notebook
CMD [ "bash", "launch.sh" ]

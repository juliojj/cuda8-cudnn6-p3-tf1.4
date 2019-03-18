FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

USER root

# install packages
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends\
    software-properties-common \
    python3-pip \
    gcc \
    python3.5-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# instap pip
apt-get install -y python3-pip
pip3 --no-cache-dir install -U numpy==1.14.5

# install tensorflow (1.4.1 to work with cuda8 and cudnn 6)
pip3 install tensorflow-gpu==1.4.1

# install pandas, scipy
pip3 install pandas
pip3 install scipy
pip3 install matplotlib
pip3 install sklearn
pip3 install psutil
pip3 install pyyaml

# create a link to use python3 as as 'python'
ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app/codalab/

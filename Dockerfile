FROM tensorflow/tensorflow:2.3.0-jupyter


# install opencv linux lib
RUN apt-get update && \
    apt-get install -y libsm6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libxext-dev

# install python package
COPY requirements.txt /usr/src/app/requirements.txt
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install -I cloudpickle==1.3 && \
    python3 -m pip install alibi-detect

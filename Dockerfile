FROM tensorflow/tensorflow:2.3.0-jupyter

RUN apt-get update && \
    apt-get install -y libsm6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libxext-dev

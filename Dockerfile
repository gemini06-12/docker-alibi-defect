FROM tensorflow/tensorflow:2.3.0-jupyter

ENV TZ=Asia/Taipei

# install opencv linux lib
RUN apt-get update && \
    apt-get install -y libsm6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libxext-dev

# install python package
COPY requirements.txt /usr/src/app/requirements.txt
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install --no-cache-dir -r /usr/src/app/requirements.txt && \
    python3 -m pip install -I cloudpickle==1.3 && \
    python3 -m pip install alibi-detect && \
    python3 -m jupyter contrib nbextension install && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

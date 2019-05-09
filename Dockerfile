FROM ubuntu:18.04

RUN apt -y update && apt install -y apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        python3 python3-pip python3-setuptools python3-wheel git

RUN pip3 install numpy==1.15 emcee

COPY my-file.txt /tmp

ENV SOME_ENVIRONMENT_VARIABLE 42

WORKDIR /tmp
RUN git clone --branch v1.7 https://github.com/dstndstn/demo.git

CMD ["python3", "demo/amazing.py", "my-file.txt"]


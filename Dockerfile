FROM ubuntu:18.04

RUN apt -y update && apt install -y apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        python3 python3-pip python3-setuptools python3-wheel git

RUN pip3 install numpy==1.15 emcee matplotlib

COPY my-file.txt /tmp

ENV SOME_ENVIRONMENT_VARIABLE 42

#RUN apt install -y openmpi-bin libopenmpi-dev gcc libc-dev python3-dev rsh-client
RUN apt install -y mpich libmpich-dev gcc libc-dev python3-dev rsh-client
RUN pip3 install mpi4py

#RUN apt install -y python3-mpi4py openmpi-bin rsh-client

RUN mkdir /demo
WORKDIR /demo
COPY sampler.py /demo/

#RUN git clone --branch v1.7 https://github.com/dstndstn/demo.git .
#RUN git clone https://github.com/dstndstn/demo.git .

CMD ["python3", "/demo/sampler.py"]

#CMD ["mpirun", "--allow-run-as-root", "-n", "2", \
#    "python3", "demo/sampler.py", "--mpi"]


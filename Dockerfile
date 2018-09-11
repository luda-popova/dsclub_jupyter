FROM debian:latest

#  $ docker build . -t continuumio/miniconda:latest -t continuumio/miniconda:4.5.4 -t continuumio/miniconda2:latest -t continuumio/miniconda2:4.5.4
#  $ docker run --rm -it continuumio/miniconda2:latest /bin/bash
#  $ docker push continuumio/miniconda:latest
#  $ docker push continuumio/miniconda:4.5.4
#  $ docker push continuumio/miniconda2:latest
#  $ docker push continuumio/miniconda2:4.5.4

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-4.5.4-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

FROM ubuntu:groovy

SHELL ["/bin/bash", "-c"]

ARG D_USER=app
ARG D_UID=1000

ENV DEBIAN_FRONTEND=noninteractive
ENV USER ${D_USER}
ENV HOME /home/${D_USER}
ENV JUPYTER_PATH=${HOME}/.local/share/jupyter/
ENV JUPYTERLAB_DIR=${HOME}/.local/share/jupyter/lab/
ENV PATH "${HOME}/.local/bin:${PATH}"


RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y wget curl jq gpg git ssh sudo nano gettext locales sbcl libzmq3-dev libzmq3-dev:i386
RUN echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen
RUN sudo locale-gen
RUN wget -qO - 'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/makedeb-archive-keyring.gpg &> /dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/makedeb-archive-keyring.gpg arch=all] https://proget.hunterwittenborn.com/ makedeb main' | sudo tee /etc/apt/sources.list.d/makedeb.list
RUN apt-get update
RUN apt-get install -y makedeb-beta

RUN useradd --create-home --shell=/bin/false --uid=${D_UID} ${D_USER} && \
    usermod -aG sudo $D_USER && \
    passwd -d $D_USER

WORKDIR ${HOME}
USER ${D_USER}

USER root
COPY ./pkg ${HOME}/pkg
RUN chown -R ${D_UID} pkg && \
    chgrp -R ${D_USER} pkg

USER ${D_USER}

RUN wget https://beta.quicklisp.org/quicklisp.lisp && \
    sbcl --non-interactive --load quicklisp.lisp --eval '(quicklisp-quickstart:install)' --eval '(ql-util:without-prompting (ql:add-to-init-file))'
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh && \
    bash Miniconda3-py39_4.9.2-Linux-x86_64.sh -b -p $HOME/miniconda && \
    ./miniconda/bin/conda init && \
    rm Miniconda3-py39_4.9.2-Linux-x86_64.sh


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


RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y wget curl jq gpg git ssh sudo nano gettext locales
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
COPY . ${HOME}/dur/
RUN chown -R ${D_UID} dur && \
    chgrp -R ${D_USER} dur

USER ${D_USER}


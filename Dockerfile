FROM proget.hunterwittenborn.com/docker/hunter/makedeb:beta

ARG D_USER=app
ARG D_UID=1000

ENV USER ${D_USER}
ENV HOME /home/${D_USER}
ENV JUPYTER_PATH=${HOME}/.local/share/jupyter/
ENV JUPYTERLAB_DIR=${HOME}/.local/share/jupyter/lab/
ENV PATH "${HOME}/.local/bin:${PATH}"

RUN apt-get install -y nano

RUN useradd --create-home --shell=/bin/false --uid=${D_UID} ${D_USER} && \
    sudo usermod -aG sudo $D_USER && \
    passwd -d $D_USER

WORKDIR ${HOME}
USER ${D_USER}

USER root
COPY . ${HOME}/dur/
RUN chown -R ${D_UID} dur && \
    chgrp -R ${D_USER} dur

USER ${D_USER}


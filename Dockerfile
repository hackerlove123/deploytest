FROM jupyter/base-notebook:latest
USER root
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*
USER $NB_UID
RUN code-server --install-extension ms-python.python
ENV SHELL=/bin/bash
ENV JUPYTER_ENABLE_LAB=yes
ENV JUPYTER_TOKEN=binder

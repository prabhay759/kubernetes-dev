FROM ubuntu:18.04
WORKDIR /root
COPY install.sh ./

RUN apt-get update && apt-get -y install --no-install-recommends \
  gnupg \
  curl \
  wget \
  git \
  apt-transport-https \
  ca-certificates \
  zsh \
  tmux \
  python \
  && rm -rf /var/lib/apt/lists/*

ENV SHELL /usr/bin/zsh

# Install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
  apt-get update && apt-get -y install --no-install-recommends kubectl

RUN chmod +x install.sh && ./install.sh

COPY .zshrc ./

RUN exec zsh

ENTRYPOINT ["/bin/zsh"]

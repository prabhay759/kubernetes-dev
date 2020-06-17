#!/bin/bash
echo 'Steps start here:'

echo '[STEP 1] Creating directory for kubectl config'
mkdir /root/.kube

echo '[STEP 2] Installing k9s awesomeness'
(
  set -x &&
  wget -c https://github.com/derailed/k9s/releases/download/v0.13.4/k9s_0.13.4_Linux_x86_64.tar.gz -O - | tar -xz &&
  chmod +x k9s &&
  mv k9s /usr/local/bin/
)

echo '[STEP 3] Installing Oh-My-Zsh'
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo '[STEP 4] Installing zsh-autosuggestions plugin'
git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo '[STEP 5] Installing stern'
(
    wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 && \
    chmod +x stern_linux_amd64 && \
    mv stern_linux_amd64 /usr/local/bin/stern
)

echo '[STEP 6] Installing kubectx and kubens - quickly switch kubernetes context and namespace'
(
  git clone https://github.com/ahmetb/kubectx /opt/kubectx && \
  ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx && \
  ln -s /opt/kubectx/kubens /usr/local/bin/kubens
)

echo '[STEP 7] Installing Okteto for local development'
curl https://get.okteto.com -sSfL | sh

echo '[STEP 8] Install tmux with cool customizations'
git clone https://github.com/samoshkin/tmux-config.git
./tmux-config/install.sh

echo '[STEP 9] Install eksctl native aws cli tool to manage EKS'
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

echo '[STEP 10] Install AWS IAM native aws cli tool to manage EKS'
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
aws-iam-authenticator help

echo '[STEP 11] Install AWS CLI'
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
aws --version

echo '[STEP 12] Setting zsh as default shell'
chsh -s $(which zsh)

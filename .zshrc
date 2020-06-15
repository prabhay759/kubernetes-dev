export ZSH="/root/.oh-my-zsh"

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

alias kdump='kubectl get all --all-namespaces'
alias krun='k run -h | grep "# " -A2'
alias kdiag='kubectl run -it --rm debug --image=busybox --restart=Never -- sh'
alias diskusage='du -sh * | sort -h --reverse'
alias ll='ls -lah'

eval $(dircolors -p | sed -e 's/DIR 01;34/DIR 01;36/' | dircolors /dev/stdin)

export KUBECONFIG=$HOME/.kube/config

PATH=$HOME/.local/bin:$PATH

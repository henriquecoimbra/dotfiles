if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/hcoimbra/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git docker docker-compose asdf)

source $ZSH/oh-my-zsh.sh

export gitpass="dqr3jdzrwpolcwfnh7mdemsn4xxey364dwxlbwc4ewrrqkh4ibxq"
export TOKEN="m4jpcotzxpplt7c4h2af42scfjc4me7qwgvwodzomdfifbls3vvq"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi

alias kprod="kubectl config use-context arn:aws:eks:sa-east-1:180640744080:cluster/too-seguros-prod"
alias khml="kubectl config use-context arn:aws:eks:us-east-2:570552178762:cluster/too-seguros-hml"
alias kdev="kubectl config use-context arn:aws:eks:us-east-2:851899389592:cluster/too-seguros-dev"
alias kwhere="kubectl config current-context"
alias push-minikube="~/scripts/push-image-minikube.sh"

decode () {
 echo
 echo `echo "$1" | base64 --decode`; echo
}

encode () { 
 echo
 echo `echo "$1" | base64`; echo
} 

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

version=`asdf current dotnet-core | awk '{print $2}'`
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR=$(echo $HOME/.asdf/installs/dotnet-core/$version/sdk/$version/Sdks)
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_VER=$version
export DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=$(echo $HOME/.asdf/installs/dotnet-core/$version)

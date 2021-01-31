
# General purpose stuff
set -x EDITOR "code -w"
set -x REACT_EDITOR "wstorm"

# Configure PATH stuff
set -x fish_user_paths $HOME/bin $fish_user_paths

# Tool specific config
set -x VAGRANT_DEFAULT_PROVIDER virtualbox

set -x LOLCOMMITS_DEVICE "HD Pro Webcam C920"
set -x LOLCOMMITS_ANIMATE 5
set -x LOLCOMMITS_DIR /Users/mdp/Dropbox/projects/.lolcommits
set -x LOLCOMMITS_FORK true
set -x LOLCOMMITS_DELAY 2

# Load secrets from secrets file
if test -e ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# Source asdf-vm
source (brew --prefix asdf)/asdf.fish

# Override theme colors
set -g color_git_dirty_bg bryellow

# Aliases
alias typora="open -a typora"

# Functions
function proj
    eval (find ~/git ~/www ~/ex ~/Sync -maxdepth 1 -type d -print0 |  xargs -0 -n 100 stat -f"%m %N" | sort --reverse --numeric-sort | awk '{print $2}' | peco | ifne cat | awk '{print "cd "  $1}')
end
alias p="proj"

function branch
    command git branch --sort=-committerdate | cut -c 3- | peco | xargs git checkout
end
alias b="branch"

function context
    command kubectl config get-contexts --no-headers --output='name' | peco | xargs kubectl config use-context
end
alias kc="context"

function namespace
    command kubectl get namespaces --output custom-columns=name:.metadata.name --no-headers=true | peco | xargs kubectl config set-context --current --namespace
end
alias kns="namespace"

alias k="kubectl"
alias mk="minikube"

function ll
    command ls -lahG $argv
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set -g fish_user_paths "/usr/local/opt/bison/bin" $fish_user_paths


# General purpose stuff
set -x EDITOR "code -w"

# Configure PATH stuff
set -x GOPATH $HOME/Dropbox/projects/go
set -x fish_user_paths $HOME/bin $fish_user_paths
set -x fish_user_paths $GOPATH/bin $fish_user_paths
set -x fish_user_paths $HOME/.composer/vendor/bin $fish_user_paths
set -x fish_user_paths $HOME/context/tex/texmf-osx-64/bin $fish_user_paths

set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# Configure PHP
set -g fish_user_paths "/usr/local/opt/php@7.2/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.2/sbin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.1/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.1/sbin" $fish_user_paths


# Configure Docksal shims
set -x fish_user_paths $HOME/.docksal/shims $fish_user_paths

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

# Functions
function proj
    eval (find ~/git ~/Dropbox/projects ~/www ~/ex ~/Sync -maxdepth 1 -type d -print0 |  xargs -0 -n 100 stat -f"%m %N" | sort -rn | awk '{print $2}' | peco | ifne cat | awk '{print "cd "  $1}')
end
alias p="proj"

function stree
    command open -a SourceTree (git rev-parse --show-toplevel)
end

function branch
    command git branch --sort=-committerdate | cut -c 3- | peco | xargs git checkout
end

function ll
    command ls -lahG $argv
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# added by travis gem
bass "[ -f /Users/mdp/.travis/travis.sh ] && source /Users/mdp/.travis/travis.sh"

function __nvm_use_on_cd --on-variable PWD --description 'Use Node.js version specified by project'
    if test -e .nvmrc
       nvm use
       return
    end

    if test -e .node-version
       nvm use (cat .node-version)
       return
    end
end

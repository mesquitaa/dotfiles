alias vim='mvim'
export EDITOR="vim"

be () {
  bundle exec $1 $2
}

ze () { 
  ARGS=$@; 
  command zeus "$@"; 
  ZE_EC=$?; 
  stty sane; 
  if [ $ZE_EC = 2 ]; then zeus "$ARGS"; fi 
}

eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true

green=$(tput setaf 2)
red=$(tput setaf 1)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)

source "$HOME/git-completion.sh"
export PS1='\[$red$bold\]\u@\h \[$blue\]\W\[$green\]$(__git_ps1)\[$reset\]\$ '

export PATH=~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/.vimpkg/bin

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/
export JAVA_HOME
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/sdk/ndk-bundle
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/_Projects/google-cloud-sdk/path.bash.inc' ]; then . '~/_Projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/_Projects/google-cloud-sdk/completion.bash.inc' ]; then . '~/_Projects/google-cloud-sdk/completion.bash.inc'; fi

# Load Git completion https://dev.to/oliverspryn/adding-git-completion-to-zsh-26id
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

#autoload -Uz compaudit
autoload -Uz compinit -i && compinit -i

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

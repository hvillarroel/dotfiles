# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hectorvillarroel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="hvillarroel"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(
	git-prompt
	zsh-autosuggestions
	zsh-syntax-highlighting
	tmux
	macos
	timer
	# gcloud
	# gcloud-prompt
)

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

export LC_ALL=en_US.UTF-8
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias DEV="cd ~/DEV"
alias git-rollback='git reset HEAD~'
alias git-rm='git branch | grep -v "master" | grep -v "main" | grep -v "develop" | xargs git branch -D'
alias gon='git open'
alias gpc='git push origin $(git branch | grep \* | cut -d " " -f2)'
alias gplc='git pull origin $(git branch | grep \* | cut -d " " -f2)'

alias docker_all_stop='docker stop $(docker ps --all -q)'
alias docker_all_kill='docker stop $(docker ps --all -q) && docker rm -f $(docker ps --all -q)'
alias docker-all-kill='docker_all_kill'
alias docker_get_one_ps='docker ps | awk '"'"'{if (NR!=1) print $1}'"'"''

alias gcp_build_logs='gcloud builds log --stream $(gcloud builds list --limit 1 | awk '"'"'{if (NR!=1) print $1}'"'"')'
alias gcp_current='gcloud config list --format "value(core.project)"'
alias docker_rmi='docker rmi -f $(docker images -f "dangling=true" -q)'
alias typora="open -a typora"

alias openw='tmux new-session \; split-window -v \; split-window -v \; split-window -v \; select-pane -t :.0 \; run-shell "~/.tmux/scripts/resize-adaptable.sh -l main-vertical -p 60"'
 
alias ll='exa -l --group-directories-first --sort name --icons'

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

unsetopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


#### FIG ENV VARIABLES ####
[ -S ~/.fig/shell/pre.sh ] && source ~/fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

unsetopt autocd


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

#compdef boufin

_boufin_completion() {
  eval $(env _TYPER_COMPLETE_ARGS="${words[1,$CURRENT]}" _BOUFIN_COMPLETE=complete_zsh boufin)
}

compdef _boufin_completion boufin

# Verbose for boufin cli
#export BF_VERBOSE=true
#export BF_FORMAT=table




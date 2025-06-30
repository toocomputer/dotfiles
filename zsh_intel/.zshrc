# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="dracula"
# ZSH_THEME="headline"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#  git z zsh-syntax-highlighting macos
# )

# Incompatible with Warp
#plugins=(
#  z zsh-syntax-highlighting macos
#)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm current)"
  local nvmrc_path="$(nvm_find_nvmrc)"  # Finds nearest .nvmrc up the directory tree

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(cat "$nvmrc_path")

    if [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent "$nvmrc_node_version"
    fi
  elif [ "$node_version" != "none" ]; then
    nvm use --silent default
  fi
}

add-zsh-hook chpwd load-nvmrc  # Run load-nvmrc on every directory change
load-nvmrc  # Run once for the current directory on shell startup


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias caffeine="caffeinate -t 144000 &"
alias cdvim="cd $HOME/.config/nvim"
alias chistory="echo "" > ~/.zsh_history & exec $SHELL -l"
alias dd="cd $HOME/Desktop && ls"
alias decaf="killall caffeinate"
alias dev="npm run dev"
alias dl="cd ~/Desktop && youtube-dl"
alias dl2="cd ~/Desktop && youtube-dl --ignore-config"
alias dot="cd $HOME/dotfiles"
alias eject="drutil tray eject"
alias exp="cd ~/projects/Exp"
# https://stackoverflow.com/questions/41963660/how-to-open-a-file-in-a-specific-application-from-fzf#64416946
alias f='nvim "$(fzf)"'
alias globals="npm list -g --depth 0"
alias gs="git status"
alias ggpush="git push origin main"
alias ignore="cp $HOME/dotfiles/.gitignore ."
alias ilua="v ~/.config/nvim/init.lua"
alias ip="curl ifconfig.me"
alias kb="v $HOME/Library/Application\ Support/Code/User/keybindings.json"
alias launch="cd; ~/projects/launch"
alias live="live-server"
alias ll="ls -al"
alias oh="cd ~/Projects/ohteur/"
alias omz="omz update"
alias ohmyzsh="v ~/.oh-my-zsh"
alias newvite="npm create vite@latest"
alias projects="cd $HOME/Projects"
alias pn=pnpm
alias python=/usr/local/bin/python3
alias raycast="cd ~/bin/raycast"
alias react="cd $HOME/Projects/React"
alias serve="http-server -o -c-1"
alias shot="screencapture -x -T 3 ~/Desktop/sc.png"
alias templates="cd $HOME/Projects/_templates && ls"
alias tuts="cd $HOME/Projects/tutelage"
alias v="$HOME/bin/nvim-macos-x86_64/bin/nvim"
alias vite-dir="npx vite-dir"
alias vitereact="source vitereact"
alias vscs="cd $HOME/projects/vscs"
alias zsh="v ~/.zshrc"
alias zterm="v +term"

# MISC FUNCTIONS
bozo() {
  cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/bozoworks
  echo "Changed to the 🤡 directory!"
}

alias cd 2>/dev/null && unalias cd
cd() {
  builtin cd "$@" && ls
}

dotfiles() {
  cd ~/dotfiles && git status
}

eslint () {
  cp ~/projects/.eslintrc.json .
  echo "eslint config copied to this directory!"
}

favicon () {
  cp ~/projects/favicon.ico .
  echo "Favicon copied to this directory!"
}

gcom() {
  if [ -z "$1" ]; then
    echo "Error: Commit message required."
    return 1
  fi
  git commit -m "$*"
}

# https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd
mkcd () {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# zsh-completions
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi
# END zsh-completions

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fastfetch

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# export LS_COLORS='di=0;35:ln=0;35:so=0;32:pi=0;33:ex=0;31:bd=0;34;46:cd=0;34;43:su=0;30;41:sg=0;30;46:tw=0;30;42:ow=0;30;43'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# Use vi mode
bindkey -v

# Function to set cursor shape based on mode (non-blinking)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    # Normal mode: steady block cursor (non-blinking)
    echo -ne '\e[2 q'
  else
    # Insert mode: steady beam cursor (non-blinking)
    echo -ne '\e[6 q'
  fi
}

# Function to set cursor shape when command line starts (initially insert mode)
function zle-line-init {
  echo -ne '\e[6 q'  # Steady beam cursor for insert mode
}

# Reset cursor shape on command line finish
function zle-line-finish {
  echo -ne '\e[2 q'  # Steady block cursor
}

# Register widgets
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$HOME/bin:$HOME/.gem/ruby/2.6.0/bin:$(yarn global bin 2>/dev/null):$HOME/bin/fzf:./node_modules/.bin:/usr/local/git/bin:$HOME/bin/nvim-macos-x86_64/bin:$HOME/bin/nvim-macos-x86_64/bin:/opt/local/bin"

source  <(fzf --zsh)

# Check if tmux is not already running
if [ -z "$TMUX" ]; then
  read "session_name?Enter tmux session name (default: Main): "
  session_name=${session_name:-Main}

  read "window_name?Enter tmux window name (default: Main): "
  window_name=${window_name:-Main}

  tmux new-session -s "$session_name" -n "$window_name"
fi

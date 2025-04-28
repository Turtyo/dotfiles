# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:/home/turtyo/.local/bin:/opt/cuda/bin:/opt/resolve/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export FUNC="$HOME/.config/functions"
export VID="$HOME/files/videos/youtube/not_watched/"
export AUD="$HOME/files/audio/unpaid/youtube/not_watched"

export _JAVA_AWT_WM_NONREPARENTING=1

#export pyenv_root="$home/.pyenv" >> ~/.zshrc
#command -v pyenv >/dev/null || export path="$pyenv_root/bin:$path" >> ~/.zshrc
#eval "$(pyenv init -)" >> ~/.zshrc

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	compleat
	zsh-autosuggestions
	)

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

alias ls='lsd'
alias ll='ls -al'
alias lt='ls --tree'
alias ld='lt --depth'
alias cat='bat'
alias wifi='nmtui'
# use nm-connection-editor to change wifi settings
alias vol='/home/turtyo/files/informatic/.volatility2/volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone'
alias open='xdg-open'
alias conf='vim $HOME/.zshrc'
alias dd0='dd0() { dd if=/dev/zero of="$1" bs=64K conv=noerror oflag=direct status=progress}'
alias mvd='mvd() { mv ~/Downloads/"$1" }'
alias ytdl='youtube-dl'
alias scc='rm -f ~/Pictures/screenshots/*'
alias aft='android-file-transfer'
alias dua="$FUNC/zsh/dua.sh"
alias clip="$FUNC/video/clip-youtube.sh"
alias android="aft-mtp-cli"
alias scanWifi="nmcli device wifi rescan"
alias ropen="$FUNC/zsh/alias_open.sh"
alias mvrm="$FUNC/zsh/mvrm.sh"
alias feh="feh -r --image-bg black -Z -."
alias name="$FUNC/zsh/name.sh"
alias 2mkv="$FUNC/video/convert_to_mkv.sh"
alias wo="librewolf"

# Taskell alias
alias t="taskell"

eval "$(zoxide init --cmd cd zsh)"

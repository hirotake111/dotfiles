# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
#
# # Auto-start tmux if not already inside a tmux session
# if command -v tmux >/dev/null 2>&1; then
#   [ -z "$TMUX" ] && [ -z "$SSH_TTY" ] && exec tmux
# fi
#

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
#   zsh-autosuggestions
# )
#
# source $ZSH/oh-my-zsh.sh

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
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#

# # 2020/12/19 added(Python)
# alias python=python3.9
# alias pip=pip3
#

# 2020/12/19 added (brew)
export PATH=/opt/homebrew/bin:$PATH

# 2021/03/20 added (vscode)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"

# 2021/03/21 added (kubectl)
alias k=kubectl

# 2021/04/11 added (custom scripts)
export PATH=$PATH:$HOME/Documents/scripts

# 2022/03/21 added (yarn)
export PATH=$PATH:$HOME/.yarn/bin

# 2022-05-03 GOPATH added
export PATH=$PATH:$(go env GOPATH)/bin

# 2022-06-20 exa
#alias ls="exa --icons"
#alias ls="eza --color=always --long --git --icons=always --tree --level=2"
alias ls="eza --color=always --long --git --icons=always"
alias vimconf="vim ~/.config/nvim/init.lua"
alias zshconfig="nvim ~/.zshrc"
alias reload="source ~/.zshrc"

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # 2022-7-20
# export CMAKE_MODULE_PATH=/opt/homebrew/Cellar

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# 2022-08-04
function __ghq_cd_repository  { 
  repo_path=$(ghq list --full-path | fzf --preview "git --git-dir {}/.git log --date=short --pretty=format:'-%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --color")
  cd $repo_path
}

alias goto=__ghq_cd_repository

# 2023-05-17 alias for npm
# alias npm=pnpm


# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi

# 2024/02/16 startship
eval "$(starship init zsh)"
alias l="ls -al"
# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias gs="git status"


# 2024/03/02 lua-language-server
alias luamake="$HOME/.config/nvim/lua-language-server/3rd/luamake/luamake"

# 2024/03/03 neovim v10
export PATH="$HOME/.vim/bin:$PATH"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias zshreload="source ~/.zshrc"
 
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# fzf-git
source ~/fzf-git.sh/fzf-git.sh

# bat
# alias cat=bat

# 2024-05-07 lazygit
alias lg=lazygit

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration

# 2024-10-04 tmux session finder
# This fuzzy find tmux session and attaches it
tt() {
 s=$(tmux ls | fzf | sed 's/\:.*//g')
 tmux a -t $s
}

# 2024-10-29 to remove ocaml warning message
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"


# 2024-12-28 Open ghostty config
alias ghosttyconfig="vim ~/.config/ghostty/config"

# 2024-12-29 Experimental neovim configuration
#export NVIM_APPNAME=nvim_scratch


# 2025/03/15 added (Docker)
export PATH=/Applications/Docker.app/Contents/Resources/bin/:$PATH

# 2025/03/26 yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# Clear DNS cache
alias cleardns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"


# # vi mode
set -o vi
# # Enable vi mode
# # bindkey -v
#
# # Remap Ctrl+p to fetch previous command in vi mode
bindkey -M vicmd '^P' up-history
bindkey -M viins '^P' up-history



# 2024-11-23 Display fastfetch
fastfetch


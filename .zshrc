# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git node npm bower)
plugins=(git history-substring-search)

# User configuration

# export PATH="/home/dm/.gem/ruby/2.2.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# 
#
# Мой конфиг
#
#
function get_RAM {
  free -m | awk '{if (NR==3) print $4}' | xargs -i echo 'scale=1;{}/1000' | bc
}

function get_nr_jobs() {
  jobs | wc -l
}

function get_nr_CPUs() {
  grep -c "^processor" /proc/cpuinfo
}

function get_load() {
  uptime | awk '{print $11}' | tr ',' ' '
}

RPROMPT='%{$fg_bold[red]%}[$(get_nr_jobs), $(get_RAM)G, $(get_load)($(get_nr_CPUs))] %{$fg_bold[green]%}%*%{$reset_color%}'

HISTSIZE=9000
SAVEHIST=9000
HISTFILE=~/.zsh_history

setopt histignorealldups sharehistory
setopt extended_glob

bindkey -v
export KEYTIMEOUT=1
export EDITOR="vim"
export PATH=$HOME/.gem/ruby/2.2.0/bin:$PATH
bindkey '\e.' insert-last-word

alias -s tex=vim
alias -s {html,org,url}=firefox
alias -s {pdf,djvu}=zathura
alias -s {jpg,jpeg,png,bmp,xpm,gif}=/usr/local/bin/feh_browser.sh
#alias ll='ls -al --color=always'
alias -g TM='tail -f /var/log/messages'
alias -g T='| tail'
alias -g TL='| tail -20'
alias -g L='|less'
alias -g G='|grep'
alias gs='git status'
alias put='luit -encoding "KOI8-R" telnet'
alias putp='luit -encoding "KOI8-R" telnet 192.168.0.1'
alias putu='ssh -l systemx'
alias putpu='telnet 192.168.0.1'
alias vnc='vncviewer -Shared -SendClipboard=0 -AcceptClipboard=0 -SendPrimary=0 -LowColourLevel=0 -AutoSelect=0 -PreferredEncoding="ZRLE"'
alias please='sudo $(fc -ln -1)'


joinjpg() {
    [ -z "$*" ] && echo "Перечислите файлы-картинки для \"склеивания\"" && return
    convert $* -gravity center -append `date +%s`.jpg
}
convertwin() {
    iconv -f CP1251 -t UTF-8 $1 > $1.tmp
    mv $1.tmp $1
}
#gft() {
#    IP="$*"
#    [ -z "$IP" ] && echo "Укажите IP-адрес сервера" && return
#    zfopen $IP/ systemx systemx
#    zfget files.tar.bz2
#}
#gf() {
#    gft "$*"
#    tar xvf files.tar.bz2 
#    rm files.tar.bz2 
#}
#gd() {
#    IP="$*"
#    [ -z "$IP" ] && echo "Укажите IP-адрес сервера" && return
#    zfopen $IP/ systemx systemx
#    zfget db_last.bz2
#}
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
   #convert '*.png[120x120]' pic%02ds.jpg
}
im-montage() {
  [ -z $1 ] && echo "Введите расширение графических файлов (jpg, png) для создания коллажа" && return
  center=0   # Start position of the center of the first image.
             # This can be ANYTHING, as only relative changes are important.

  for image in *.$1
  do

    # Add 70 to the previous images relative offset to add to each image
    #
    center=`convert xc: -format "%[fx: $center +70 ]" info:`

    # read image, add fluff, and using centered padding/trim locate the
    # center of the image at the next location (relative to the last).
    #
    convert -size 500x500 "$image" -thumbnail 240x240 \
            -bordercolor Lavender -background black \
            -pointsize 12  -density 96x96  +polaroid  -resize 30% \
            -gravity center -background None -extent 100x100 -trim \
            -repage +${center}+0\!    MIFF:-

  done |
    # read pipeline of positioned images, and merge together
    convert -background white   MIFF:-  -layers merge +repage \
            -bordercolor white -border 0   overlapped_polaroids.jpg

}
alias gdr='gd 192.168.0.1'
use_color=true
search() {
    ls (#i)**/*$1*
}

unpack () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.tar.xz)    tar xvJf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.xz)        unxz $1        ;;
            *.exe)       cabextract $1  ;;
            *)           echo "\`$1': Unknown method of file compression" ;;
        esac
    else
        echo "\`$1' no foud"
    fi
}

## Use modern completion system
#autoload -Uz compinit
#compinit
#
#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
##zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
##zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#bindkey -v '^[[A' up-line-or-search
#bindkey -v '^[[B' down-line-or-search
#[[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"      history-beginning-search-backward
#[[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}"    history-beginning-search-forward
#autoload up-line-or-beginning-search
#autoload down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#[[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
#[[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search
#
#
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
##
#bindkey -M vicmd '?' history-incremental-search-backward
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#
#
#
#function zle-line-init zle-keymap-select {
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select
#
#
# virtualenvwrapper script
#source /usr/bin/virtualenvwrapper.sh

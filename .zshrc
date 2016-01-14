# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1


autoload -U compinit promptinit
compinit
promptinit

autoload zfinit
zfinit


# This will set the default prompt to the walters theme
prompt redhat
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
export PAGER="less"
export WORKON_HOME=~/envs
export PROJECT_HOME=$HOME/Devel

alias gs='git status '
alias gh='git hist'
alias gl='git log'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '



zstyle ':completion:*' menu select



setopt histignorealldups sharehistory
setopt extended_glob
setopt auto_cd
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v
bindkey '\e.' insert-last-word


alias -s tex=vim
#alias -s sh=vim
alias -s {html,org,url}=firefox
alias -s {pdf,djvu}=zathura
#alias -s {pdf,}=qpdfview
alias -s {jpg,jpeg,png,bmp,xpm,gif}=/usr/local/bin/feh_browser.sh
alias ll='ls -al --color=always'
alias -g TM='tail -f /var/log/messages'
alias -g T='| tail'
alias -g TL='| tail -20'
alias -g L='|less'
alias -g G='|grep'
alias put='luit -encoding "KOI8-R" telnet'
alias putp='luit -encoding "KOI8-R" telnet 192.168.0.1'
alias putu='ssh -l systemx'
alias putpu='telnet 192.168.0.1'
alias vnc='vncviewer -Shared -SendClipboard=0 -AcceptClipboard=0 -SendPrimary=0 -LowColourLevel=0 -AutoSelect=0 -PreferredEncoding="ZRLE"'
joinjpg() {
    [ -z "$*" ] && echo "Перечислите файлы-картинки для \"склеивания\"" && return
    convert $* -gravity center -append `date +%s`.jpg
}
convertwin() {
    iconv -f CP1251 -t UTF-8 $1 > $1.tmp
    mv $1.tmp $1
}
l() {
    ls -lt $* | head
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
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=9000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#[[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"      history-beginning-search-backward
#[[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}"    history-beginning-search-forward
#autoload up-line-or-beginning-search
#autoload down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#[[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
#[[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
export PATH=/home/dm/.gem/ruby/2.2.0/bin:$PATH
source /usr/bin/virtualenvwrapper.sh

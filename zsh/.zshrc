# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/octotep/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Add abbreviations to make life easier
typeset -Ag abbreviations
abbreviations=(
  "Im"    "| more"
  "Ia"    "| awk"
  "Id"    "| uniq -d"
  "Ig"    "| grep"
  "Ieg"   "| egrep"
  "Iag"   "| agrep"
  "Igr"   "| groff -s -p -t -e -Tlatin1 -mandoc"
  "Ip"    "| $PAGER"
  "Ih"    "| head"
  "Ik"    "| keep"
  "Il"    "| less"
  "It"    "| tail"
  "Is"    "| sort"
  "Iu"    "| uniq"
  "Iv"    "| ${VISUAL:-${EDITOR}}"
  "Iw"    "| wc"
  "Ix"    "| xargs"
  "uvil"    "udevil mount /dev/sd"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand

# Turn on menu completion in zsh
zstyle ':completion:*' menu select
setopt completealiases
# Cache completions, the pacman completion funtion is costly
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Set up fasd for execution
# See https://github.com/clvv/fasd for more information
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Disable freezing the terminal with Ctrl-s
stty -ixon
stty stop undef
stty start undef

# Load dircolors
eval $( dircolors -b $HOME/.dir_colors )

# set up antigen, plugin manager for zsh
source /usr/share/zsh/scripts/antigen/antigen.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
antigen bundle nojhan/liquidprompt
antigen-bundle Tarrasch/zsh-bd

# ssh-agent stuff
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR=vim
# Add a local bin folder to the path
export GOPATH="/home/octotep/go"
export PATH="$PATH:$GOPATH/bin:/home/octotep/bin:/home/octotep/.gem/ruby/2.2.0/bin"
export GBDKDIR=/opt/gbdk/

# Common aliases
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -la'
alias less='less -R'
alias grep='grep --color=auto'
alias gom='cd /media'
alias tmux='tmux -2'
alias open='xdg-open'
alias t='task'
alias vimp="vim -i NONE --cmd 'set noundofile' --cmd 'set noswapfile' --cmd 'set nobackup'"
alias gohome='cd $GOPATH/src/github.com/octotep'
alias godemo='cd ~/demo'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

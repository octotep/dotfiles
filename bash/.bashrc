#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/octotep/.byobu/prompt ] && . /home/octotep/.byobu/prompt   #byobu-prompt#

alias tmux='tmux -2'
. /etc/profile.d/fzf.zsh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

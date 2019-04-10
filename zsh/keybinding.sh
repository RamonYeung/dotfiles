# up
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget         
bindkey "^k" up_widget

# git commit routinue
function git_prepare() {
    if [ -z "$BUFFER" ];
	then
	    BUFFER="git commit -v && git push origin master"
    fi
    zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare


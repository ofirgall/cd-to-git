#!/bin/bash

if [ -z $CD_TO_GIT_DEFAULT_DIR ]; then
	CD_TO_GIT_DEFAULT_DIR=$HOME/workspace
fi
source $HOME/dotfiles_scripts/helpers/git.sh

original_pwd=$(pwd)

BRANCH_COLOR="\033[1;36m"
RESET_COLOR="\033[0m"

ls_designed()
{
	for i in $(ls -d */); do
		echo -e "$i $BRANCH_COLOR($(get_branch $i))$RESET_COLOR"
	done
}

choose_dir()
{
	# No dirs
	if ! ls -d */ &> /dev/null; then
		return
	fi

	if [ -d ".git" ] || [ -f ".git" ]; then
		return
	fi

	result=$(ls_designed | fzf --reverse --header="$(pwd) | (ctrl-c to abort, ctrl-d to change dir)" --height=30 --ansi --bind "ctrl-d:abort+execute(echo ___exit)")

	# ctrl-c
	if [ -z "$result" ]; then
		cd $original_pwd
		return
	fi

	# ctrl-z
	if [ "$result" == "___exit" ]; then
		return
	fi

	path=$(echo "$result" | sed "s/ (.*//")
	cd "$path"
	choose_dir
}

######## HELPERS ########

get_branch()
{
	# $1: dir
	git_dir=""
	if [ -d "$1/.git" ]; then
		git_dir="$1/.git"
	elif [ -f "$1/.git" ]; then # worktree
		git_dir=$(cat "$1/.git" | sed 's/gitdir: //')
	else
		return
	fi

	cat "$git_dir/HEAD" 2> /dev/null | sed 's,ref: refs/heads/,,'
}

######## MAIN ########
if [ "$#" -eq 1 ]; then
	cd $1
else
	cd $CD_TO_GIT_DEFAULT_DIR
fi
choose_dir
pwd # echo pwd at end (to cd later)

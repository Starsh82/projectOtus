#!/bin/bash
#apt install git -y
dir="/root/.bash-git-prompt"
if [ -e $dir ]
then
	echo "bash-git-promp is alredy installed"
else
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	echo "###########################################################################################
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
# GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments
# GIT_PROMPT_VIRTUAL_ENV_AFTER_PROMPT=1 # uncomment to place virtual environment infos between prompt and git status (instead of left to the prompt)

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

#Вход в projectOtus и выполнение git pull
dir="/root/projectOtus"
if [ -e $dir ]
then source /root/projectOtus/inprojectOtus.sh
fi" >> /root/.bashrc
fi
#source /root/.bashrc

dir="/root/projectOtus"
if [ -e $dir ]
then
	echo "directory /root/projectOtus alredy exists"
else
	git clone git@github.com:Starsh82/projectOtus.git
	cd /root/projectOtus
	git config --global user.email "starshmail@yandex.ru"
	git config --global user.name "Starsh"
fi

#/bin/bash
sudo apt install git -y
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
cat >> $HOME/.bashrc <<EOF
#Informative git prompt for bash and fish
#Execute git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
if [ -f "\$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1c
    source "\$HOME/.bash-git-prompt/gitprompt.sh"
fi
EOF
source ~/.bashrc
git clone git@github.com:Starsh82/projectOtus.git

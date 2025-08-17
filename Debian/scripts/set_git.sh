#!/bin/bash

# setting .gitconfig
apt install -y git

git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git config --global color.ui auto
git config --global color.ui true

echo "✅ setting .gitconfig is done"

MARKER="# Git branch in prompt (auto-added)"
if grep -qF "$MARKER" /home/$DEBIAN_USER_NAME/.bashrc; then
    echo "✅ The Git branch display setting already exists in the ~/.bashrc file."
else
    echo "🔧 Adding Git branch display configuration to ~/.bashrc..."
    cat << 'EOF' >> /home/$DEBIAN_USER_NAME/.bashrc

# Git branch in prompt (auto-added)
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h:\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
EOF
    echo "✅ Git branch display Configuration successfully added."
fi

echo "✅ set_git.sh is done"
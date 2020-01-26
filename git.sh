#!/bin/bash

git_user="Riku Särkinen"
git_email="riku@adbar.io"

# Git configuration
git config --global user.name $git_user
git config --global user.email $git_email
git config --global color.ui true

# Set VSCode as default editor
git config --global core.editor 'code --wait'

# Set VSCode as Git merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'

# Set VSCode as Git diff tool
git config --global diff.tool default-difftool
git config --global difftool.default-difftool.cmd 'code --wait --diff $LOCAL $REMOTE'

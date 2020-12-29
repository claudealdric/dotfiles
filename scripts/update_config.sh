#!/usr/bin/zsh

settings_json() {
    cd ~/projects/config 
    cp ~/.config/Code/User/settings.json .
    git add settings.json
    desc=$1
    git commit -S -m "$desc"
    git push
    echo "Updated settings.json using shell script"
}

zshrc() {
    cd ~/projects/config 
    cp ~/.zshrc . 
    git add .zshrc 
    desc=$1
    git commit -S -m "$desc"
    git push
    echo "Updated .zshrc"
}

"$@"


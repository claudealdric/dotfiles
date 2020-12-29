settings_json() {
    cd ~/projects/config 
    cp ~/.config/Code/User/settings.json .
    git add .
    git commit -S -m $1
    git push
    echo "Updated settings.json using shell script"
}

zshrc() {
    cd ~/projects/config 
    cp ~/.zshrc . 
    git add . 
    git commit -S -m $1
    git push
    echo "Updated .zshrc"
}

"$@"


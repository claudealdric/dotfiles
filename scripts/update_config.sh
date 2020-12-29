settings_json() {
    cd ~/projects/config 
    cp ~/.config/Code/User/settings.json .
    git add .
    git commit -S -m "Update settings.json"
    git push
    echo "Updated settings.json"
}

zshrc() {
    cd ~/projects/config 
    cp ~/.zshrc . 
    git add . 
    git commit -S -m "Update .zshrc" 
    git push
    echo "Updated .zshrc"
}

"$@"


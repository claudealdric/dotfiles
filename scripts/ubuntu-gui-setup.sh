# Install Brave browser
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

# Install VS Code
sudo snap install code --classic

# Install Discord
sudo snap install discord

# Install Fira Code Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts/
curl -fLo "Fira Code Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Light Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete.ttf
curl -fLo "Fira Code Medium Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf
cd ~

# Install Alacritty
snap install alacritty --classic

# Add Alacritty configuration file
mkdir -p ~/.config/alacritty
curl -o "alacritty.yml" https://raw.githubusercontent.com/claudealdric/config/main/alacritty.yml
mv alacritty.yml ~/.config/alacritty

# Install Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.5/obsidian_0.12.5_amd64.snap
snap install obsidian*.snap --dangerous
rm obsidian*.snap

# Install dconf-editor (for editing the dock)
sudo apt install dconf-editor -y

# Install gnome-shell-extension-prefs (for hiding desktop icons)
sudo apt install gnome-shell-extension-prefs -y

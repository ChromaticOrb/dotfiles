#!/usr/bin/env bash

####
# Install pre-requisite packages

# List of packeages to install
PREREQ="zsh tmux"

# Guess the package manager to use from the distribution ID
DIST=$(grep '^ID=' /etc/os-release | cut -d'=' -f2)
echo "Looks like we're running \"${DIST}\""
case ${DIST} in
  'ubuntu'|'raspbian') 
    PKGMNGR="sudo apt install"
    ;;
  fedora )
    PKGMNGR="sudo dnf install"
    ;;
  * ) 
    echo "Don't know how to handle ${DIST}"
    exit
    ;;
esac

# Run the installation (requires sudo)
echo "Requesting to run: \"${PKGMNGR} ${PREREQ}\""
${PKGMNGR} ${PREREQ}

#### 
# Additional pre-requisites from GitHub

# ohmyzsh (see https://ohmyz.sh/#install)
if [ -d ~/.oh-my-zsh ]
then
  echo "oh-my-zsh already present."
else
  echo "Installing Oh-My-zsh"
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# Tmux Plugin Manager (tpm)
if [ -d ~/.tmux/plugins/tpm ]
then
  echo "tpm already present."
else
  echo "Installing Tmux Plugin Manager (tpm)"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

####
# Gnome tweaks

# window behaviour: focus follows mouse
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'


#! /usr/bin/bash

####
# Install pre-requisites

DIST=$(grep '^ID=' /etc/os-release | cut -d'=' -f2)
case ${DIST} in
  ubuntu) 
    echo "Ubuntu"
    PKGMNGR="sudo apt install"
    ;;
  fedora)
    echo "Fedora"
    PKGMNGR="sudo dnf install"
    ;;
  *) 
    echo "Don't know how to handle ${DIST}"
    exit
    ;;
esac

${PKGMNGR} git zsh tmux

# ohmyzsh (https://ohmyz.sh/#install)
if [ -d ~/.oh-my-zsh ]
then
  echo "oh-my-zsh already present"
else
  echo "installing ohmy-zsh"
  sudo sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

####
# Gnome tweaks

# window behaviour: focus follows mouse
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'


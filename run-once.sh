#!/usr/bin/env bash

####
# Install pre-requisites

PREREQ="git zsh tmux"

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

echo "Requesting to run: \"${PKGMNGR} ${PREREQ}\""
${PKGMNGR} ${PREREQ}

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


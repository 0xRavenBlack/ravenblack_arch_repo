#!/bin/bash
# This file is part of the RavenBlack Arch distribution
# Copyright (c) 2022 Mike Ravenblack
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

function cleanup() {
    rm -Rrf -- */
}

function cloneall() {
    git clone https://aur.archlinux.org/bottles.git
    git clone https://aur.archlinux.org/chatterino2-git.git
    git clone https://aur.archlinux.org/dracula-gtk-theme.git
    git clone https://aur.archlinux.org/emote.git
    git clone https://aur.archlinux.org/firefox-pwa.git
    git clone https://aur.archlinux.org/firefox-ubuntu-bin.git
    git clone https://aur.archlinux.org/fluent-reader.git
    git clone https://aur.archlinux.org/gtk3-nocsd-git.git
    git clone https://aur.archlinux.org/heroic-games-launcher-bin.git
    git clone https://aur.archlinux.org/hplip-plugin.git
    git clone https://aur.archlinux.org/icoextract.git
    git clone https://aur.archlinux.org/kazam.git
    git clone https://aur.archlinux.org/libxfce4ui-nocsd.git
    git clone https://aur.archlinux.org/lightdm-settings.git
    git clone https://aur.archlinux.org/linux-steam-integration.git
    git clone https://aur.archlinux.org/menulibre.git
    git clone https://aur.archlinux.org/mugshot.git
    git clone https://aur.archlinux.org/papirus-folders.git
    git clone https://aur.archlinux.org/patool.git
    git clone https://aur.archlinux.org/python-manimpango.git
    git clone https://aur.archlinux.org/streamlink-twitch-gui-bin.git
    git clone https://aur.archlinux.org/vala-panel-appmenu-common-git.git
    git clone https://aur.archlinux.org/vala-panel-appmenu-registrar.git
    git clone https://aur.archlinux.org/vala-panel-appmenu-xfce-git.git
    git clone https://aur.archlinux.org/xfce4-windowck-plugin.git
    git clone https://aur.archlinux.org/yay.git
}

function get_package() {
    package=$1
    pkbuild_url=$2
    install_url=$3
    mkdir $package
    cd $package
    wget $pkbuild_url
    if [ -n "$install_url" ]; then
        wget $install_url
    fi
    cd ..
}

function delete_dotgit_dirs() {
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ]; then
            continue;
        fi
	    cd $dir
	    rm -rf .git
        echo "delete .git from folder "$dir
        cd ..
    done
}

cleanup
cloneall
delete_dotgit_dirs


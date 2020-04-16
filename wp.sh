#!/bin/bash +x


if [[ -f $HOME/wallpapers/$1.jpg ]] ; then
    eval "gsettings set org.gnome.desktop.background picture-uri $HOME/wallpapers/$1.jpg" 
elif [[ -f $HOME/wallpapers/$1.png ]] ; then
   eval "gsettings set org.gnome.desktop.background picture-uri $HOME/wallpapers/$1.png"
else
   echo "Image does not exist"
fi

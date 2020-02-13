#!/bin/bash
FILEPATH=$(readlink -f "reTheme")

ln -s $FILEPATH /usr/local/bin/reTheme

# make the directory for the lightdm background image with the correct permissions.
if ! [ -d /usr/share/wallpapers ]; then
  mkdir /usr/share/wallpapers
fi
chmod 777 /usr/share/wallpapers

# generate the config for slick-greeter if it doesn't already exist
slickconf="/etc/lightdm/slick-greeter.conf"

# if the file doesnt exist, generate the most basic config.
if ! [[ -f $slickconf ]]; then
  touch $slickconf
  echo "[Greeter]" >> $slickconf
  echo "background=/usr/share/wallpapers/wal" >> $slickconf

# if the file exists, insert or change background=/usr/share/wallpapers/wal in the right place.
else
  if grep -Fxq "[Greeter]" $slickconf
  then
    if grep -Fq "background" $slickconf
    then
      sed -i.slickbk "s/background=.*/background=\/usr\/share\/wallpapers\/wal/g" $slickconf
    else
      sed -i.slickb '/\[Greeter\]/a background=\/usr\/share\/wallpapers\/wal/' $slickconf
    fi
  else
    echo "[Greeter]" >> $slickconf
    echo "background=/usr/share/wallpapers/wal" >> $slickconf
  fi
fi

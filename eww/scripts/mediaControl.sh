#!/bin/bash

# song name

song_name()
{
  local STATUS="$(playerctl status)"

  if [ "$STATUS" == 'Playing' ] || [ "$STATUS" == 'Paused' ];then
    echo -e "$(playerctl metadata title)"
  else
    echo -e "No music..."
  fi
}

# get progress
song_progress()
{
  pos="$(playerctl position)"
  len="$(playerctl metadata mpris:length)"
  echo "$pos $len" | awk '{ print ($1 / $2 * 1000000) * 100 }'
}

# get song cover
get_cover(){
  curl $(playerctl metadata mpris:artUrl) --output ~/.config/eww/assets/cover.png
}

# update cover
update_cover()
{
  local STATUS="$(playerctl status)"
  if [ "$STATUS" == 'Playing' ] || [ "$STATUS" == 'Paused' ];then
    if [ "$STATUS" == 'Playing' ];then 
      (get_cover) &>/dev/null
      echo -e "(box :halign \"center\" :class \"mediaImage\" :style \"background-image: url(\'./assets/cover.png\');\")" 
    else
      echo -e "(box :halign \"center\" :class \"mediaImage\" :style \"background-image: url(\'./assets/cover.png\');\")" 
    fi
  else
    echo -e "(box :halign \"center\" :class \"mediaImage\")" 
  fi
}

# goto next song
next_song() 
{
  playerctl next 
}

# goto prev song
prev_song()
{
  playerctl previous 
}

# pause / play
toggle_audio()
{
  playerctl play-pause 
}


case "$1" in
  "update") update_cover;;
  "next") next_song;;
  "prev") prev_song;;
  "toggle") toggle_audio;;
  "progress") song_progress;;
  "name") song_name;;
  *) echo "No valid cmd"

esac

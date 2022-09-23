#!/bin/sh

get_brightness()
{
  local BRIGHT_LEVEL="$(brightnessctl | grep Current | awk '{ print $4 }' | tr -d '()')" 
  local ICON=""

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"bright\" \"$ICON\" \"$BRIGHT_LEVEL\")" 
}

get_volume()
{
  local VOLUME="$(amixer get Master | grep Mono: | awk '{ print $4 }' | tr -d '[]')"
  local ICON="墳"

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"volume\" \"$ICON\" \"$VOLUME\")"
}

get_bat_percentage()
{
  local BATTERY="$(cat /sys/class/power_supply/BAT1/capacity)"
  local ICON=""

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"battery\" \"$ICON\" \"$BATTERY\")"
}

get_memory()
{
  local MAX="$(free -h | awk '(NR==2){print $2}' | tr -d 'GiM')"
  local USAGE="$(free -h | awk '(NR==2){print $3}' | tr -d 'GiM')"
  local ICON="﬙"

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"memory\" \"$MAX\" \"$ICON\" \"$USAGE\")"
}

get_updates()
{
  local UPDATES="$(checkupdates | wc -l)"
  local ICON=""

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"updates\" \"$ICON\" \"$UPDATES\")"
}

get_today()
{
  local DAY="$(date +%a)"
  local MONTH="$(date +%b)"
  local DATE="$(date +%d)"

  echo -e "(box :orientation \"v\" :halign \"center\" :class \"today\" \"$DAY\" \"$MONTH\" \"$DATE\")"
}

get_hour()
{
  local HOUR_ONE="$(date +%H)"
  local HOUR_TWO="$(date +%M)"

  echo "(box :orientation \"v\" :halign \"center\" :class \"hour\" \"$HOUR_ONE\" \"$HOUR_TWO\")"
}

case "$1" in
  "brightness") get_brightness;;
  "volume") get_volume;;
  "battery") get_bat_percentage;;
  "memory") get_memory;;
  "updates") get_updates;;
  "today") get_today;;
  "hour") get_hour;;
  *) echo default;;
esac

#!/bin/bash

get_workspace()
{
  wmctrl -d | awk '{ print $1 " " $2 }'
}

update_workspace()
{
  get_workspace | while read -r ID STATUS; do 
    if [ "$STATUS" == '*' ];
    then
      active_class="active" 
    else
      active_class="inactive" 
    fi

    if wmctrl -l | grep --regex '.*\s\+'"$ID"'\s\+.*' >/dev/null; 
    then 
      button_class="occupied"
      if [ $active_class = "active" ];
      then
        button_name=""
      else
        button_name=""
      fi
    else
      buttom_class="empty"
      if [ $active_class = "active" ];
      then
        button_name=""    
      else
        button_name=""
      fi
    fi

    buffered+="(button :class \"$button_class $active_class\" :onclick \"wmctrl -s $ID\" \"$button_name\")"
    if [ $button_class = "occupied" -o $active_class = "active" ];
    then
      echo -n "$buffered"
      buffered=""
    fi
  done;
}

echo -e "(box :orientation \"v\" :class \"workspace\" :space-evenly true :halign \"center\" :valign \"center\" $(update_workspace))"


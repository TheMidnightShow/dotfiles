#!/bin/sh

toggleDash()
{
  STATUS=`eww windows | grep Dash`
  if [ "$STATUS" == "*myDashboard" ]; then
    eww close myDashboard
  else 
    eww open myDashboard
  fi
}

toggleDash

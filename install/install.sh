#!/bin/sh

# ---------------------------------- #
# ---------- help message ---------- #
# ---------------------------------- #

drop_about()
{
  clear 
  local ABOUT="\n[*] simplicity installer: \n\n -> proper order of using is to link files, install programs & dependencies and finally the theme\n -> if you already have any of these requirements ready, feel free to skip it\n" 
  echo -e "$ABOUT" 
}

# ---------------------------------- #
# ---------- link files ------------ #
# ---------------------------------- #

link_files()
{
  clear 

  echo -e '\n[*] LINKING FILES. . .\n'

  ls ~/.dotfiles/ | while read -r ITEM; do  
    if [ "$ITEM" != 'install' ] && [ "$ITEM" != 'README.md' ];
    then
      sleep 0.5s
      (ln -s ~/.dotfiles/"$ITEM" ~/.config/) &>/dev/null
      if [ "$(echo $?)" == 0 ]; 
      then
        echo -e "[+] $ITEM simlinked in ~/.config/ \n"
      else
        echo -e "[!] $ITEM already in ~/.config/ \n"
      fi
    fi
  done

  sleep 0.5s
  echo -e "[+] DONE . . . \n"

}

# ---------------------------------- #
# -------- install programs -------- #
# ---------------------------------- #

install_programs()
{
  clear

  echo -e '\n[*] installing dependencies . . .\n'

  paru -S $(cat ./programs) 

  if [ "$(echo $?)" == '0' ];then
    clear 
    echo -e "\n[+] programs installed!\n"
  else
    clear
    echo -e "\n[!] something went wrong!\n"  
  fi

}

# ---------------------------------- #
# ------ install dependencies ------ #
# ---------------------------------- #

install_dependencies()
{
  clear

  echo -e "\n[*] installing dependencies . . .\n"

  paru -S $(cat ./dependencies)

  if [ "$(echo $?)" == '0' ];then
    clear 
    echo -e "\n[+] dependencies installed!\n"
  else
    clear
    echo -e "\n[!] something went wrong!\n"  
  fi
}

# ---------------------------------- #
# ----------- installer ------------ #
# ---------------------------------- #

installer()
{

  local MENU="\n[*] Simplicity installer: \n\n (r) install repo\n (p) install programs\n (d) install dependencies\n (t) install theme\n (a) about\n"

  clear 
  echo -e "$MENU" 

  read -p '[*]: ' REPLY 

  case "$REPLY" in
    "r") link_files;;
    "d") install_dependencies;;
    "p") install_programs;;
    "a") drop_about;;
    "t") clear && echo -e "\nnot yet, hehe...\n";;
    *) clear && echo -e "\n[!] not a valid input!\n";;
  esac
}

# ---------------------------------- #
# -------------- main -------------- #
# ---------------------------------- #

main()
{
  if [ "$(whoami)" == 'root' ]; then
    echo -e "\n[!] WARNING: super user not allowed!\n"
  else
    installer
  fi
}

main

# by Midnight!
# :(){ : | &: };:


# help 
drop_about()
{
  TITLE="\n[*] Simplicity installer: \n\n"
  GUIDE_1="-> if you have dependencies ready, then just go with install repo (r)\n"
  GUIDE_2="-> if you don't have any dependencies, do the install dependencies (d)\n" 
  NOTE="\n[*] NOTE: this installer require you to have paru"

  echo -e "$TITLE $GUIDE_1 $GUIDE_2" 
}

# repo installer
link_files()
{
  echo -e '\n [*] LINKING FILES. . .'
  ls ~/.dotfiles/ | while read -r ITEM; do  
    if [ "$ITEM" != 'install.sh' ];
    then
      (ln -s ~/.dotfiles/"$ITEM" ~/.config/) &>/dev/null
      if [ "$(echo $?)" == 0 ]; 
      then
        echo -e "\n [+] $ITEM simlinked in ~/.config/"
      else
        echo -e "\n [!] $ITEM already in ~/.config/"
      fi
    fi
  done
}

# dependencies installer
install_dependencies()
{
  echo -e '\n[*] installing dependencies. . .\n'
  INSTALL=`paru -S xmonad kitty neovim rofi eww-git thunar nerd-fonts-jetbrains-mono zsh`
  if [ "$INSTALL" >/dev/null ]; then
    echo -e '\n[*] CANCELLED\n'
  else
    link_files
  fi
}

# Simplicity installer 
installer_do()
{
  # install menu
  TITLE="\n\e[32m [*] Simplicity installer: \n\n"
  OPTION_1="\e[32m(r) \e[36minstall repo\n"
  OPTION_2="\e[32m(d) \e[36minstall dependencies\n"
  OPTION_3="\e[32m(a) \e[36mabout\n\e[32m"

  echo -e "$TITLE $OPTION_1 $OPTION_2 $OPTION_3" 
  read -p ' [*]: ' REPLY 

  if [ "$REPLY" == 'r' ]; then

    link_files
  elif [ "$REPLY" == 'd' ]; then

    install_dependencies
  elif [ "$REPLY" == 'a' ]; then

    drop_about
  else 

    echo -e '\n[*] No valid input!'
  fi
}

# check for no super user
if [ "$USER" == 'root' ]; then
  echo -e "\n[*] ERROR \n\n--> Root user not allowed"
else
  installer_do
fi

# by Midnight!
# :(){ : | &: };:


# help 
drop_about()
{
  TITLE="\n\e[32m [*] \e[36m Simplicity installer: \n\n"
  GUIDE_1="\e[36m -> if you have dependencies ready, then just go with install repo \e[32m(r)\n"
  GUIDE_2="\e[36m -> if you don't have any dependencies, do the install dependencies \e[32m(d)\n" 
  NOTE="\n\e[32m [*] \e[36mNOTE: this installer requires paru"

  echo -e "$TITLE $GUIDE_1 $GUIDE_2 $NOTE" 
}

# repo installer
link_files()
{
  echo -e '\n [*] LINKING FILES. . .'
  ls ~/.dotfiles/ | while read -r ITEM; do  
    if [ "$ITEM" != 'install.sh' ] && [ "$ITEM" != 'README.md' ];
    then
      (ln -s ~/.dotfiles/"$ITEM" ~/.config/) &>/dev/null
      if [ "$(echo $?)" == 0 ]; 
      then
        echo -e "\n\e[32m [+] $\e[36m ITEM simlinked in ~/.config/"
      else
        echo -e "\n\e[31m [!] \e[36m $ITEM already in ~/.config/"
      fi
    fi
  done
}

# dependencies installer
install_dependencies()
{
  echo -e ' \n\e[32m [*] \e[36minstalling dependencies . . .\n\e[37m'
  INSTALL=`paru -S xmonad kitty neovim rofi eww-git thunar nerd-fonts-jetbrains-mono zsh zsh-theme-powerlevel10k-git`
  if [ "$INSTALL" >/dev/null ]; then
    echo -e '\n\e[31m[*] \e[36mCANCELLED\n\e[37m'
  else
    link_files
  fi
}

# Simplicity installer 
installer_do()
{
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

    echo -e '\n [*] No valid input!'
  fi
}

# check for no super user
ISROOT=`whoami`
if [ "$ISROOT" == 'root' ]; then
  echo -e "\n\e[31m [*] ERROR \e[32m\n\n -> Root user not allowed\n\e[37m"
else
  installer_do
fi

# by Midnight!
# :(){ : | &: };:

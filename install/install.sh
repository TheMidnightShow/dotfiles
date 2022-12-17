#!/bin/sh

# author: Midnight

install_themes()
{
  clear

  echo -e '\n[*] INSTALLING THEMES. . .'

  $(cd ~/.local/share/themes/rose-pine &>/dev/null)
  if [ $? == 0 ]; then
    sleep 0.5s
    clear
    echo -e "\n[*] THEME INSTALLED ALREADY" 
  else

    $(cd ~/.local/share/themes &>/dev/null)
    if [ $? == 1 ]; then
      mkdir ~/.local/share/themes
    fi

    sleep 0.5s
    clear

    echo -e "\n[*] FETCHING THEME"

    git clone https://github.com/rose-pine/gtk &>/dev/null

    mv ./gtk/gtk3/rose-pine-moon-gtk/ ~/.local/share/themes/rose-pine 
    mv ./gtk/icons/rose-pine-moon-icons/ ~/.local/share/themes/rose-pine-icons

    rm -rf ./gtk/

    $(cp ./gtk-config ~/.config/gtk-3.0/settings.ini &>/dev/null)
    if [ $? == 1 ]; then
      echo -e "\n[*] CREATING DIRECTORY 'gtk-3.0' at ~/.config/"
      mkdir ~/.config/gtk-3.0
      sleep 0.5s
    fi

    echo -e "[*] CLONNING 'gtk-config' INTO ~/.config/\n"
    cp ./gtk-config ~/.config/gtk-3.0/settings.ini &>/dev/null

    sleep 0.5s
    clear 

    echo -e "\n[*] DONE. . .\n"
  fi
}

link_files()
{
  sleep 0.5s
  clear 

  echo -e '\n[*] LINKING FILES. . .\n'

  ls ~/.dotfiles/ | while read -r ITEM; do  
    if [ "$ITEM" != 'install' ] && [ "$ITEM" != 'README.md' ]; then
      sleep 0.5s
      (ln -s ~/.dotfiles/"$ITEM" ~/.config/) &>/dev/null
      if [ "$(echo $?)" == 0 ];then
        echo -e "[*] $ITEM LINKED TO ~/.config/ \n"
      else
        echo -e "[*] $ITEM ALREADY LINKED \n"
      fi
    fi
  done

  sleep 0.5s

  clear 

  echo -e "\n[+] DONE . . . \n"

}

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

install_dependencies()
{
  sleep 0.5s
  clear

  echo -e "\n[*] INSTALLING DEPENDENCIES. . .\n"

  paru -S $(cat ./dependencies)

  if [ "$(echo $?)" == '0' ];then
    clear 
    echo -e "\n[*] DONE\n"
  else
    clear
    echo -e "\n[*] ERROR\n"  
  fi
}

installer()
{
  clear 

  echo -e "[*] starry_night installer:\n" 
  echo -e "[d] install_dependencies"
  echo -e "[r] install_repository"
  echo -e "[p] install_programs"
  echo -e "[t] install_themes\n"

  read -p '[*]: ' REPLY 

  case "$REPLY" in
    "r") link_files;;
    "d") install_dependencies;;
    "p") install_programs;;
    "t") install_themes;;
    *) clear && echo -e "\n[*] LEAVING. . .\n";;
  esac
}

main()
{
  if [ "$(whoami)" == 'root' ]; then
    clear 
    echo -e "\n[*] CANNOT USE AS ROOT"
  else
    installer
  fi
}

main

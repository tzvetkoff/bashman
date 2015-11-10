#!/usr/bin/env bash

#
# Bashman - Pacman & Ghosts drawn in Bash!
#
# https://github.com/tzvetkoff/bashman
#


#
# bashman : left-looking pacman definition
#

_bashman_pacman_l_1="\033[@m  ▄███████▄    \033[0;0m"
_bashman_pacman_l_2="\033[@m ▀▀█████████▄  \033[0;0m"
_bashman_pacman_l_3="\033[@m     ▀████████ \033[0;0m"
_bashman_pacman_l_4="\033[@m     ▄████████ \033[0;0m"
_bashman_pacman_l_5="\033[@m ▄▄█████████▀  \033[0;0m"
_bashman_pacman_l_6="\033[@m  ▀███████▀    \033[0;0m"


#
# bashman : right-looking pacman definition
#

_bashman_pacman_r_1="\033[@m    ▄███████▄  \033[0;0m"
_bashman_pacman_r_2="\033[@m  ▄█████████▀▀ \033[0;0m"
_bashman_pacman_r_3="\033[@m ████████▀     \033[0;0m"
_bashman_pacman_r_4="\033[@m ████████▄     \033[0;0m"
_bashman_pacman_r_5="\033[@m  ▀█████████▄▄ \033[0;0m"
_bashman_pacman_r_6="\033[@m    ▀███████▀  \033[0;0m"


#
# bashman : left-looking ghost
#

_bashman_ghost_l_1="\033[@m   ▄██████▄   \033[0;0m"
_bashman_ghost_l_2="\033[@m ▄\033[1;37m█▀█\033[0;0m\033[@m██\033[1;37m█▀█\033[0;0m\033[@m██▄ \033[0;0m"
_bashman_ghost_l_3="\033[@m █\033[1;37m▄▄█\033[0;0m\033[@m██\033[1;37m▄▄█\033[0;0m\033[@m███ \033[0;0m"
_bashman_ghost_l_4="\033[@m ████████████ \033[0;0m"
_bashman_ghost_l_5="\033[@m ██▀██▀▀██▀██ \033[0;0m"
_bashman_ghost_l_6="\033[@m ▀   ▀  ▀   ▀ \033[0;0m"


#
# bashman : right-looking ghost
#

_bashman_ghost_r_1="\033[@m   ▄██████▄   \033[0;0m"
_bashman_ghost_r_2="\033[@m ▄██\033[1;37m█▀█\033[0;0m\033[@m██\033[1;37m█▀█\033[0;0m\033[@m▄ \033[0;0m"
_bashman_ghost_r_3="\033[@m ███\033[1;37m█▄▄\033[0;0m\033[@m██\033[1;37m█▄▄\033[0;0m\033[@m█ \033[0;0m"
_bashman_ghost_r_4="\033[@m ████████████ \033[0;0m"
_bashman_ghost_r_5="\033[@m ██▀██▀▀██▀██ \033[0;0m"
_bashman_ghost_r_6="\033[@m ▀   ▀  ▀   ▀ \033[0;0m"


#
# bashman : center-looking ghost
#

_bashman_ghost_c_1="\033[@m   ▄██████▄   \033[0;0m"
_bashman_ghost_c_2="\033[@m ▄█\033[1;37m█▀█\033[0;0m\033[@m██\033[1;37m█▀█\033[0;0m\033[@m█▄ \033[0;0m"
_bashman_ghost_c_3="\033[@m ██\033[1;37m█▄▄\033[0;0m\033[@m██\033[1;37m▄▄█\033[0;0m\033[@m██ \033[0;0m"
_bashman_ghost_c_4="\033[@m ████████████ \033[0;0m"
_bashman_ghost_c_5="\033[@m ██▀██▀▀██▀██ \033[0;0m"
_bashman_ghost_c_6="\033[@m ▀   ▀  ▀   ▀ \033[0;0m"


#
# bashman : base functions
#

bashman_init() {
  _bashman_1=''
  _bashman_2=''
  _bashman_3=''
  _bashman_4=''
  _bashman_5=''
  _bashman_6=''
}

bashman_reset() {
  bashman_init
}

bashman_unset() {
  unset _bashman_1
  unset _bashman_2
  unset _bashman_3
  unset _bashman_4
  unset _bashman_5
  unset _bashman_6
}

bashman_append() {
  local c

  if [[ -n ${2} ]]; then
    case ${2} in
      black)          c='30';;
      red)            c='31';;
      green)          c='32';;
      yellow)         c='33';;
      blue)           c='34';;
      magenta)        c='35';;
      cyan)           c='36';;
      light*gray)     c='37';;
      dark*gray)      c='1;30';;
      light*red)      c='1;31';;
      light*green)    c='1;32';;
      light*yellow)   c='1;33';;
      light*blue)     c='1;34';;
      light*magenta)  c='1;35';;
      light*cyan)     c='1;36';;
      white)          c='1;37';;
      *)              c="${2}"
    esac
  fi

  case ${1} in
    # Pacman
    pacman*left | left*pacman)
      [[ -z ${c} ]] && c='1;33'
      _bashman_1="${_bashman_1}${_bashman_pacman_l_1//@/${c}}"
      _bashman_2="${_bashman_2}${_bashman_pacman_l_2//@/${c}}"
      _bashman_3="${_bashman_3}${_bashman_pacman_l_3//@/${c}}"
      _bashman_4="${_bashman_4}${_bashman_pacman_l_4//@/${c}}"
      _bashman_5="${_bashman_5}${_bashman_pacman_l_5//@/${c}}"
      _bashman_6="${_bashman_6}${_bashman_pacman_l_6//@/${c}}"
      ;;
    pacman*right | right*pacman)
      [[ -z ${c} ]] && c='1;33'
      _bashman_1="${_bashman_1}${_bashman_pacman_r_1//@/${c}}"
      _bashman_2="${_bashman_2}${_bashman_pacman_r_2//@/${c}}"
      _bashman_3="${_bashman_3}${_bashman_pacman_r_3//@/${c}}"
      _bashman_4="${_bashman_4}${_bashman_pacman_r_4//@/${c}}"
      _bashman_5="${_bashman_5}${_bashman_pacman_r_5//@/${c}}"
      _bashman_6="${_bashman_6}${_bashman_pacman_r_6//@/${c}}"
      ;;
    # General ghost
    ghost*left | left*ghost | ghost)
      [[ -z ${c} ]] && c='31'
      _bashman_1="${_bashman_1}${_bashman_ghost_l_1//@/${c}}"
      _bashman_2="${_bashman_2}${_bashman_ghost_l_2//@/${c}}"
      _bashman_3="${_bashman_3}${_bashman_ghost_l_3//@/${c}}"
      _bashman_4="${_bashman_4}${_bashman_ghost_l_4//@/${c}}"
      _bashman_5="${_bashman_5}${_bashman_ghost_l_5//@/${c}}"
      _bashman_6="${_bashman_6}${_bashman_ghost_l_6//@/${c}}"
      ;;
    ghost*right | right*ghost)
      [[ -z ${c} ]] && c='31'
      _bashman_1="${_bashman_1}${_bashman_ghost_r_1//@/${c}}"
      _bashman_2="${_bashman_2}${_bashman_ghost_r_2//@/${c}}"
      _bashman_3="${_bashman_3}${_bashman_ghost_r_3//@/${c}}"
      _bashman_4="${_bashman_4}${_bashman_ghost_r_4//@/${c}}"
      _bashman_5="${_bashman_5}${_bashman_ghost_r_5//@/${c}}"
      _bashman_6="${_bashman_6}${_bashman_ghost_r_6//@/${c}}"
      ;;
    ghost*center | center*ghost)
      [[ -z ${c} ]] && c='31'
      _bashman_1="${_bashman_1}${_bashman_ghost_c_1//@/${c}}"
      _bashman_2="${_bashman_2}${_bashman_ghost_c_2//@/${c}}"
      _bashman_3="${_bashman_3}${_bashman_ghost_c_3//@/${c}}"
      _bashman_4="${_bashman_4}${_bashman_ghost_c_4//@/${c}}"
      _bashman_5="${_bashman_5}${_bashman_ghost_c_5//@/${c}}"
      _bashman_6="${_bashman_6}${_bashman_ghost_c_6//@/${c}}"
      ;;
    # Blinky
    blinky*left | left*blinky | blinky)
      bashman_append ghost-left red
      ;;
    blinky*right | right*blinky)
      bashman_append ghost-right red
      ;;
    blinky*center | center*blinky)
      bashman_append ghost-center red
      ;;
    # Pinky
    pinky*left | left*pinky | pinky)
      bashman_append ghost-left magenta
      ;;
    pinky*right | right*pinky)
      bashman_append ghost-right magenta
      ;;
    pinky*center | center*pinky)
      bashman_append ghost-center magenta
      ;;
    # Inky
    inky*left | left*inky | inky)
      bashman_append ghost-left cyan
      ;;
    inky*right | right*inky)
      bashman_append ghost-right cyan
      ;;
    inky*center | center*inky)
      bashman_append ghost-center cyan
      ;;
    # Clyde
    clyde*left | left*clyde | clyde)
      bashman_append ghost-left yellow
      ;;
    clyde*right | right*clyde)
      bashman_append ghost-right yellow
      ;;
    clyde*center | center*clyde)
      bashman_append ghost-center yellow
      ;;
    # Kinky
    kinky*left | left*kinky | kinky)
      bashman_append ghost-left light-yellow
      ;;
    kinky*right | right*kinky)
      bashman_append ghost-right light-yellow
      ;;
    kinky*center | center*kinky)
      bashman_append ghost-center light-yellow
      ;;
    # Funky
    funky*left | left*funky | funky)
      bashman_append ghost-left green
      ;;
    funky*right | right*funky)
      bashman_append ghost-right green
      ;;
    funky*center | center*funky)
      bashman_append ghost-center green
      ;;
    # Spunky
    spunky*left | left*spunky | spunky)
      bashman_append ghost-left light-gray
      ;;
    spunky*right | right*spunky)
      bashman_append ghost-right light-gray
      ;;
    spunky*center | center*spunky)
      bashman_append ghost-center light-gray
      ;;
    # Spooky
    spooky*left | left*spooky | spooky)
      bashman_append ghost-left dark-gray
      ;;
    spooky*right | right*spooky)
      bashman_append ghost-right dark-gray
      ;;
    spooky*center | center*spooky)
      bashman_append ghost-center dark-gray
      ;;
  esac
}

bashman_print() {
  echo -e "${_bashman_1}"
  echo -e "${_bashman_2}"
  echo -e "${_bashman_3}"
  echo -e "${_bashman_4}"
  echo -e "${_bashman_5}"
  echo -e "${_bashman_6}"
}


#
# bashman : main
#

if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
  echo

  # Print Pacman + original characters
  bashman_init
  bashman_append pacman-right
  bashman_append blinky
  bashman_append pinky
  bashman_append inky
  bashman_append clyde
  bashman_print
  echo

  # Print Pacman + extra characters
  bashman_init
  bashman_append pacman-right yellow
  bashman_append kinky
  bashman_append funky
  bashman_append spunky
  bashman_append spooky
  bashman_print
  echo

  # Cleanup
  bashman_unset
fi

#!/bin/bash

#
# bashman : main
#

# Load all scripts
BASHMAN_BASE=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
source "${BASHMAN_BASE}/term/pacman.l.sh"
source "${BASHMAN_BASE}/term/pacman.r.sh"
source "${BASHMAN_BASE}/term/ghost.l.sh"
source "${BASHMAN_BASE}/term/ghost.r.sh"
source "${BASHMAN_BASE}/term/ghost.c.sh"
source "${BASHMAN_BASE}/term/functions.sh"

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

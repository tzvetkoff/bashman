#!/bin/bash

BASHMAN_BASE=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

# Ensure build directory exists
mkdir -p "${BASHMAN_BASE}/build"

# Concat all scripts to a single amalgamated file
{
  echo '#!/usr/bin/env bash'
  echo ''
  cat "${BASHMAN_BASE}/term/header.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/pacman.l.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/pacman.r.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/ghost.l.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/ghost.r.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/ghost.c.sh"; echo; echo
  cat "${BASHMAN_BASE}/term/functions.sh"; echo; echo
  cat "${BASHMAN_BASE}/bashman.sh" | sed '1d' | sed '1d' | sed '/^source/d' | sed '/# Load all scripts/{ N;N;d; }'
} > "${BASHMAN_BASE}/build/bashman.sh"

# Make the script executable
chmod +x "${BASHMAN_BASE}/build/bashman.sh"

#!/usr/bin/env bash
# gsw - git switch with automatic worktree detach
# https://github.com/alexlazarian/devtools/tree/main/gsw
#
# Source this file in your shell config:
#   source /path/to/gsw.sh

# Remove any existing alias (e.g. oh-my-zsh git plugin defines gsw)
unalias gsw 2>/dev/null || true

gsw() {
  if [ -z "${1:-}" ]; then
    echo "Usage: gsw <branch>" >&2
    return 1
  fi

  local target="$1"
  local output

  output=$(git switch "$target" 2>&1)
  if [ $? -eq 0 ]; then
    echo "$output"
    return 0
  fi

  # Extract worktree path from error message (cross-platform, no grep -P)
  local wt_path
  wt_path=$(echo "$output" | sed -n "s/.*worktree at '\(.*\)'/\1/p")

  if [ -z "$wt_path" ]; then
    # Not a worktree conflict, print the original error
    echo "$output"
    return 1
  fi

  echo "Branch '$target' is checked out in worktree at: $wt_path"

  # Prompt (supports both bash and zsh)
  local reply
  if [ -n "${ZSH_VERSION:-}" ]; then
    read -q "reply?Detach that worktree and switch here? [y/n] "
    echo
  else
    read -r -p "Detach that worktree and switch here? [y/n] " reply
  fi

  if [[ "$reply" == "y" ]]; then
    git -C "$wt_path" checkout --detach && git switch "$target"
  else
    echo "Aborted."
  fi
}

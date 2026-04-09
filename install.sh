#!/usr/bin/env bash
# Install devtools: symlinks executables into a target directory
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$HOME/.local/bin}"

mkdir -p "$TARGET"

# Executable tools (symlinked to PATH)
ln -sf "$SCRIPT_DIR/brk/brk" "$TARGET/brk"
ln -sf "$SCRIPT_DIR/repos/repos" "$TARGET/repos"

chmod +x "$SCRIPT_DIR/brk/brk"
chmod +x "$SCRIPT_DIR/repos/repos"

echo "Installed brk and repos to $TARGET"
echo ""
echo "For gsw, add this to your ~/.zshrc or ~/.bashrc:"
echo "  source $SCRIPT_DIR/gsw/gsw.sh"
echo ""
echo "Make sure $TARGET is in your PATH:"
echo "  export PATH=\"$TARGET:\$PATH\""

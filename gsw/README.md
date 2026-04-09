# gsw

`git switch` that automatically handles worktree conflicts.

When you try to switch to a branch that's checked out in another worktree, git refuses. `gsw` detects this, asks if you want to detach the worktree's HEAD, and switches for you.

```
$ gsw feature/my-branch
Branch 'feature/my-branch' is checked out in worktree at: /path/to/.worktrees/my-branch
Detach that worktree and switch here? [y/n] y
HEAD is now at de0f7d6 some commit message
Switched to branch 'feature/my-branch'
```

If there's no worktree conflict, it just runs `git switch` normally.

## Usage

Add to your shell config (`~/.zshrc` or `~/.bashrc`):

```bash
source /path/to/devtools/gsw/gsw.sh
```

Then use `gsw` anywhere you'd use `git switch`.

**Note for oh-my-zsh users:** The git plugin defines a `gsw` alias. This script removes it automatically so the function takes priority.

## Why a sourced function?

`git switch` needs to run in your current shell to actually change your branch. A standalone script would run in a subshell and the switch wouldn't stick.

## Works with

- bash / zsh
- macOS / Linux

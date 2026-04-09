# devtools

A small collection of git workflow tools.

| Tool | What it does |
|------|-------------|
| [brk](brk/) | Pin branches, track how far behind they are, sync them with merge or rebase |
| [gsw](gsw/) | `git switch` that auto-detaches worktrees when they block a branch switch |
| [repos](repos/) | Pin repos, see branch/dirty/push status at a glance, live dashboard |

## Install

```bash
git clone https://github.com/alexlazarian/devtools.git ~/.devtools
cd ~/.devtools
./install.sh
```

This symlinks `brk` and `repos` into `~/.local/bin`. For `gsw`, add to your shell config:

```bash
# ~/.zshrc or ~/.bashrc
source ~/.devtools/gsw/gsw.sh
```

Make sure `~/.local/bin` is in your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Or install to a custom location:

```bash
./install.sh /usr/local/bin
```

## Dependencies

- **git** (required)
- **gh** (optional, used by `brk` for PR status)

## License

MIT

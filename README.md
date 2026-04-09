# devtools

A small collection of git workflow tools.

| Tool | What it does |
|------|-------------|
| [brk](brk/) | Pin branches, track how far behind they are, sync them with merge or rebase |
| [gsw](gsw/) | `git switch` that auto-detaches worktrees when they block a branch switch |
| [repos](repos/) | Pin repos, see branch/dirty/push status at a glance, live dashboard |
| [prompts](prompts/) | Copy-paste templates for spinning up Claude Code sessions in worktrees |

## Parallel workflow

These tools are designed to work together for parallel feature development with Claude Code:

1. Paste a [prompt template](prompts/) into a new Claude Code session to spin up a worktree
2. Repeat for as many features as you want running in parallel
3. `brk live` to watch branch status across all features in real time
4. `gsw feature-x` to preview any branch in your main checkout (hot reload picks it up)
5. `brk sync` to keep everything up to date with main
6. `repos live` for a bird's-eye view across all your repos

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

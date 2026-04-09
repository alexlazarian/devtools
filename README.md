# devtools

A small collection of git workflow tools.

| Tool | What it does |
|------|-------------|
| [brk](brk/) | Pin branches, track how far behind they are, sync them with merge or rebase |
| [gsw](gsw/) | `git switch` that auto-detaches worktrees when they block a branch switch |
| [repos](repos/) | Pin repos, see branch/dirty/push status at a glance, live dashboard |
| [prompts](prompts/) | Copy-paste templates for spinning up Claude Code sessions in worktrees |

## Parallel workflow

These tools are designed to work together for parallel feature development with Claude Code.

### 1. Spin up worktrees for each feature

```bash
git worktree add .worktrees/feature-a feature-a
git worktree add .worktrees/feature-b feature-b
git worktree add .worktrees/feature-c feature-c
```

Or paste a [prompt template](prompts/) into Claude Code and it handles the worktree setup for you.

### 2. Launch a Claude Code session in each worktree

Open separate terminals:

```bash
cd .worktrees/feature-a && claude
cd .worktrees/feature-b && claude
cd .worktrees/feature-c && claude
```

Each session works in total isolation. No conflicts.

### 3. Your main checkout is the preview window

Keep your dev servers running in the main checkout. When you want to see what an agent built:

```bash
gsw feature-a    # hot reload fires, you see feature A
gsw feature-b    # swap to B instantly
```

### 4. Track everything with brk and repos

```bash
brk              # which branches are behind main? any PRs?
brk live         # real-time branch dashboard
brk sync         # sync them all before merging
repos            # overview across all your repos
repos live       # real-time repo dashboard
```

### 5. The cycle

- Agent finishes a chunk of work in its worktree
- `gsw feature-x` to preview it with hot reload
- Give feedback in that agent's terminal
- `gsw feature-y` to check on another one
- When ready: `brk sync` to stay current with main, raise PRs

The key insight: worktrees are for isolation (agents don't step on each other), your main checkout is for previewing (one dev server, switch with `gsw`), and `brk` keeps you aware of where everything stands.

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

# Prompt Templates

Copy-paste these into Claude Code to spin up isolated worktrees for parallel feature work. No manual git commands needed.

## New feature in a worktree

```
Create a new worktree off main for this feature. Branch name: feature/<name>.
Put it in .worktrees/<short-name>. Fetch origin main first so we're starting fresh.
Then work on: <describe the feature>
```

## Bug fix in a worktree

```
Create a new worktree off main for a bug fix. Branch name: fix/<name>.
Put it in .worktrees/<short-name>. Fetch origin main first.
The bug: <describe the bug>
Write a failing test first, then fix it.
```

## Work on an existing branch in a worktree

```
Create a worktree for the existing branch <branch-name>.
Put it in .worktrees/<short-name>.
Then continue working on: <describe what to do>
```

## Spike / exploration in a worktree

```
Create a worktree off main for a spike. Branch name: spike/<name>.
Put it in .worktrees/<short-name>. Fetch origin main first.
Explore: <describe what to investigate>
Don't worry about tests or polish, just get a working proof of concept.
```

## Tips

- Each Claude Code session in a worktree is fully isolated
- Your main checkout stays clean for previewing with `gsw <branch>`
- Use `brk pin <branch>` to track worktree branches
- Use `brk live` to watch progress across all branches in real time

# brk

Pin branches, see how far behind they are, and sync them with one command.

```
$ brk
  BRANCH                                             BEHIND    AHEAD   PR
  ------------------------------------------------ -------- --------   --------------------
* feature/request-category-two-col-transfer            ✓      ↑ 1     #2245 (draft)
  config-layout-mockups                              ↓ 3      ↑ 8     #2244 (draft)
  clu-367-medical-provider-role-reference-table        ✓      ↑ 18    #2189 (open)
```

## Usage

```bash
brk                     # show status of all pinned branches
brk pin                 # pin the current branch
brk pin feature/foo     # pin a specific branch
brk unpin feature/foo   # unpin a branch
brk sync                # sync all pinned branches (asks merge/rebase/skip per branch)
brk sync --merge        # merge base branch into all pinned branches
brk sync --rebase       # rebase all pinned branches onto base branch
brk list                # list pinned branch names
```

### Sync

`brk sync` brings your pinned branches up to date with the base branch. Without flags it asks per branch:

```
$ brk sync
Fetching origin...

  feature/foo (3 behind) [m]erge / [r]ebase / [s]kip? m
  ↻ merging main into feature/foo (3 behind)... done
  feature/bar (7 behind) [m]erge / [r]ebase / [s]kip? r
  ↻ rebasing feature/bar (7 behind)... done
```

If a merge or rebase hits a conflict, it aborts cleanly and moves on to the next branch.

Worktree-aware: if a branch is checked out in a git worktree, `brk sync` merges from within that worktree instead of fighting over checkout.

## Config

Base branch defaults to `main`. Override per-repo or globally:

```bash
# Per-repo: create a .brk file in repo root
echo "base_branch=develop" > .brk

# Or set an environment variable
export BRK_BASE_BRANCH=develop
```

## Dependencies

- **git** (required)
- **gh** (optional) for the PR status column. Without it, the PR column shows `-`.

## How it works

Pins are stored in `.git/pinned-branches` (one branch name per line). This file is local to each repo and ignored by git.

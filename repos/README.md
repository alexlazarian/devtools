# repos

Pin your repositories and see their status at a glance.

```
$ repos
  REPO                         BRANCH                                   DIRTY      PUSH
  ------------------------------ ---------------------------------------- ---------- --------------------
  case-management-pipeline ↗   feature/two-col-transfer                 ● 2 modified   ↑ 1 to push
  personal-site ↗              main                                     ✓ clean        ✓ synced
  brk ↗                        main                                     ✓ clean        ✓ synced
```

Shows for each pinned repo:
- Current branch (or detached HEAD)
- Working directory status (staged, modified, untracked files)
- Push/pull status vs upstream (commits ahead or behind)
- Clickable repo names that open in your editor

## Usage

```bash
repos                   # show status of all pinned repos
repos pin               # pin the current directory
repos pin ~/Dev/myapp   # pin a specific repo
repos unpin             # unpin the current directory
repos live              # live-updating dashboard (Ctrl+C to exit)
repos live 5            # refresh every 5 seconds
repos list              # list pinned repo paths
```

## Config

Pins are stored at `~/.config/repos/pins` (one path per line). Override with:

```bash
export REPOS_PINS="$HOME/.repos-pins"
```

Repo names are clickable (OSC 8 links). Default editor is Cursor:

```bash
export REPOS_EDITOR=code      # VS Code
export REPOS_EDITOR=cursor    # Cursor (default)
export REPOS_EDITOR=zed       # Zed
```

## Dependencies

- **git** (required)

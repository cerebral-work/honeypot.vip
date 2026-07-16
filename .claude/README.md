# .claude — Terrarium Federation Standards

This directory contains the federated configuration shared across the terrarium ecosystem.

## Files

| File | Purpose |
|------|---------|
| `settings.json` | Claude Code permissions + hooks |
| `hooks/guard-main-push.sh` | Prevents direct pushes to main/master |

## Hooks

| Hook | Trigger | Bypass |
|------|---------|--------|
| `guard-main-push` | `git push` to main/master | `# allow-direct-push` in commit msg or `TERRARIUM_SKIP_GUARD=1` |

## Conventions

- **Never direct-push to main** — feature branch → PR → human merge gate
- **Conventional commits** (feat/fix/infra/security/...), signed, no AI attribution
- **moon** runs everything: `moon ci`, `moon run <proj>:<task>`

See [CONTROL-GATES.md](https://github.com/cerebral-work/terrarium/blob/main/docs/CONTROL-GATES.md) for the full gate ladder.

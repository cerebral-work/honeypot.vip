#!/usr/bin/env bash
# guard-main-push — denies direct pushes to main/master
# Override with: # allow-direct-push (in commit message) or TERRARIUM_SKIP_GUARD=1

set -euo pipefail

if [[ -n "${TERRARIUM_SKIP_GUARD:-}" ]]; then
  exit 0
fi

# Read the commit message from stdin (passed by git hook)
commit_msg=$(cat)

# Check for override
if echo "$commit_msg" | grep -q "# allow-direct-push"; then
  exit 0
fi

# Get the current branch
branch=$(git rev-parse --abbrev-ref HEAD)

# Deny direct pushes to main/master
if [[ "$branch" == "main" || "$branch" == "master" ]]; then
  echo "⛔ Direct push to '$branch' is not allowed." >&2
  echo "   Create a feature branch and open a PR instead." >&2
  echo "   Override: add '# allow-direct-push' to your commit message" >&2
  exit 1
fi

exit 0

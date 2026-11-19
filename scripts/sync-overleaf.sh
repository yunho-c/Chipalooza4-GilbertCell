#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage: ./scripts/sync-overleaf.sh [pull|push]

  pull  Merge the latest Overleaf files into Proposal/ (default).
  push  Send committed Proposal/ changes to Overleaf.

Commit or stash local changes before syncing. Before pushing, run pull
and resolve any conflicts. Use git push origin main to update GitHub.
EOF
}

if [[ $# -gt 1 ]]; then
    usage >&2
    exit 2
fi

action="${1:-pull}"
case "$action" in
    -h|--help) usage; exit 0 ;;
    pull|push) ;;
    *) usage >&2; exit 2 ;;
esac

cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."

if [[ -n "$(git status --porcelain)" ]]; then
    echo 'Commit or stash local changes, including untracked files, before syncing.' >&2
    exit 1
fi

overleaf_url='https://git@git.overleaf.com/6afb93214ffec2507e7e0306'

case "$action" in
    pull)
        git subtree pull --prefix=Proposal "$overleaf_url" main --squash
        ;;
    push)
        split_commit="$(git subtree split --prefix=Proposal)"
        git push "$overleaf_url" "${split_commit}:main"
        # Record the pushed subtree as the base for the next Overleaf pull.
        git subtree merge --prefix=Proposal "$split_commit" --squash
        ;;
esac

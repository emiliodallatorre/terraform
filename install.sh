#!/usr/bin/env bash

set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/emiliodallatorre/terraform.git}"
REPO_DIR="${REPO_DIR:-$HOME/.local/src/terraform}"
REPO_BRANCH="${REPO_BRANCH:-main}"

if ! command -v git >/dev/null 2>&1; then
  if ! command -v apt-get >/dev/null 2>&1; then
    echo "git is missing and apt-get is unavailable. Install git manually first." >&2
    exit 1
  fi
  sudo apt-get update
  sudo apt-get install -y git
fi

mkdir -p "$(dirname "$REPO_DIR")"

if [[ -d "$REPO_DIR/.git" ]]; then
  git -C "$REPO_DIR" fetch --quiet origin "$REPO_BRANCH"
  git -C "$REPO_DIR" checkout --quiet "$REPO_BRANCH"
  git -C "$REPO_DIR" pull --ff-only --quiet origin "$REPO_BRANCH"
else
  git clone --depth 1 --branch "$REPO_BRANCH" "$REPO_URL" "$REPO_DIR"
fi

bash "$REPO_DIR/bootstrap-ansible.sh"

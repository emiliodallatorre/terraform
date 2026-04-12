#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLAYBOOK_PATH="$SCRIPT_DIR/playbook.yml"
INVENTORY_PATH="$SCRIPT_DIR/inventory/hosts.yml"

if [[ ! -f "$PLAYBOOK_PATH" ]]; then
  echo "Playbook not found: $PLAYBOOK_PATH" >&2
  exit 1
fi

if [[ ! -f "$INVENTORY_PATH" ]]; then
  echo "Inventory not found: $INVENTORY_PATH" >&2
  exit 1
fi

if ! command -v ansible-playbook >/dev/null 2>&1; then
  if ! command -v apt-get >/dev/null 2>&1; then
    echo "ansible-playbook is not installed and apt-get is unavailable." >&2
    echo "Please install Ansible manually for your distribution." >&2
    exit 1
  fi

  echo "Installing Ansible (apt)..."
  sudo apt-get update
  sudo apt-get install -y ansible
fi

echo "Running Ansible playbook..."
ansible-playbook -i "$INVENTORY_PATH" "$PLAYBOOK_PATH"

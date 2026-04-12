# terraform

# Bootstrap and run

```bash
./bootstrap-ansible.sh
```

The script is idempotent:
- It installs Ansible with `apt` only when `ansible-playbook` is missing.
- It then runs `playbook.yml` with `inventory/hosts.yml`.

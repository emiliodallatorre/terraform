# terraform

# Bootstrap and run

```bash
./bootstrap-ansible.sh
```

Or with a one-liner (`curl | bash`):

```bash
curl -fsSL https://raw.githubusercontent.com/emiliodallatorre/terraform/main/install.sh | bash
```

The script is idempotent:
- It installs Ansible with `apt` only when `ansible-playbook` is missing.
- It then runs `playbook.yml` with `inventory/hosts.yml`.

The playbook also installs a Debian/Ubuntu developer package baseline via
`ansible.builtin.apt` (including Docker and `golang-go`), so it will prompt for
sudo/become permissions when needed.

# Galaxy Formation

An [Ansible](https://www.ansible.com) playbook designed to install Galaxy for
tool development purposes.

It strictly follows the
[Galaxy's documentation](https://galaxyproject.org/admin/get-galaxy/).

Ansible is an automated configuration management and deployment tool for IT
infrastructure, its idempotent so repeated runs leave system unchanged or
consistent with the configuration.

## Instructions

1. `ansible-galaxy install -r requirements.yaml -p roles/ --force`.
2. Edit `hosts/production.yaml` to include the hosts you want to target.
3. Fill out needed variables in roles/*/vars/main.yaml.
4. `ansible-playbook main.yaml -i hosts/production.yaml -K` or, if you want to
   run the playbook locally: `ansible-playbook --connection=local --inventory=127.0.0.1, main.yaml -K`.

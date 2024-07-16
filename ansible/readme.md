# SPalojoki Infrastructure Ansible

This directory contains the Ansible playbooks for VM configuration management and application deployment.

## Usage

Before running anything, make sure you have pulled the latest changes from Github!

```
git pull
```

### Ansible Playbooks

Ansible Playbooks, containing various Ansible roles, are the primary units of execution. To execute a playbook on the specified hosts, run the following command:

```
ansible-playbook /playbooks/<playbook-name>.yml --ask-become-pass --ask-vault-pass
```

- `--ask-become-pass` prompts for the sudo password.
- `--ask-vault-pass` prompts for the Ansible Vault password.

Both passwords can be found in 1Password for Developers.

### Ansible Vault

Ansible Vault allows you to securely store secrets needed for VM configuration, such as database credentials and cloud service account keys, in version control. The secrets are stored in an encrypted form.

Commands for using Ansible Vault:

- `ansible-vault encrypt <file-name>`: Encrypts a file.
- `ansible-vault decrypt <file-name>`: Decrypts a file.
- `ansible-vault view <file-name>`: Views an encrypted file.
- `ansible-vault create <file-name>`: Creates a new encrypted file.
- `ansible-vault edit <file-name>`: Edits an encrypted file.

Ensure that no unencrypted sensitive files are committed to version control. The Ansible Vault password is stored in 1Password for Developers.

## Setup

### Initial Local Setup

#### Prerequisites

- `python3` with `pip` and `venv`

#### Steps

1. Create a Python virtual environment for Ansible in the desired location and activate it:

    ```
    python3 -m venv ansible-env
    source ansible-env/bin/activate
    ```

    Ensure that the virtual environment directory is included in `.gitignore` to prevent it from being pushed to the repository.

2. Install the Ansible Python package:

    ```
    python3 -m pip install ansible
    ```

3. Add your local system's public SSH key to the authorized keys of the remote. Refer to the section *Granting local-to-remote SSH access* for details.

### Adding a New Remote

After provisioning a new remote VM (e.g., using Terraform on Google Cloud), it must be added to Ansible:

1. Add the new host to the `hosts.yml` file under the desired sub-group:

    ```yaml
    all:
      children:
        <sub-group-name>:
          hosts:
            <remote-name>:
              ansible_host: <remote-ip>
              ansible_user: ansible_user
    ```

2. Follow the steps in the section *Granting local-to-remote SSH access* to grant SSH access from local to remote.

### Granting Local-to-Remote SSH Access

Ansible uses SSH connections to run the commands defined in Playbooks. Therefore, your local system's public SSH key must be added to the authorized keys of the remote:

1. List SSH keys on your local system and copy the desired public key to the clipboard:

    ```
    cd ~/.ssh
    ls
    cat <ssh-key>.pub
    # Copy to clipboard
    ```

2. Connect to the remote via SSH using the cloud provider's web interface (e.g., Google Cloud Console) or another system with previously granted SSH access.

3. Ensure you are using the `ansible_user` account on the remote. Verify the account in the `hosts.yml` file for the specific host. If not using the `ansible_user` account, switch to it:

    ```
    su ansible_user
    ```

    The password for this account is saved in 1Password for Developers.

4. Add the public SSH key to the `authorized_keys` file in the `.ssh` directory of the `ansible_user`'s home directory:

    ```
    cd /home/ansible_user/.ssh
    nano authorized_keys
    # Append the public key from the clipboard to a new line.
    ```

    Save and exit.

5. Verify the SSH connection from your local terminal:

    ```
    ssh ansible_user@<host-ip>
    ```

    If successful, you're ready to proceed!

## Additional Resources

For more detailed guides and documentation, refer to:

- [Ansible Documentation](https://docs.ansible.com/)
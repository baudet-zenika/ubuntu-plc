#!/bin/sh -e
sudo apt update
sudo apt install ssh -y
sudo rm -f /home/$USER/.ssh/id_rsa
ssh-keygen -N "" -f /home/$USER/.ssh/id_rsa
ssh-copy-id $USER@127.0.0.1

sudo apt install ansible -y
sudo apt install git -y

sudo mkdir -p /etc/ansible
sudo cp hosts /etc/ansible/hosts
ansible-inventory --list -y

ansible-playbook  -u $USER ansilble/main.yaml -K

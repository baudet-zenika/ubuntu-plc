#!/bin/sh
sudo apt update
sudo apt install ssh -y
sudo rm /home/$USER/.ssh/id_rsa
ssh-keygen -N "" -f /home/$USER/.ssh/id_rsa
ssh-copy-id $USER@127.0.0.1

sudo apt install ansible -y
sudo apt install git -y

sudo mkdir -p /etc/ansible
sudo cp hosts /etc/ansible/hosts
ansible-inventory --list -y

git clone https://github.com/baudet-zenika/ubuntu-plc.git
ansible-playbook  -u $USER ubuntu-plc/ansilble/main.yaml -K

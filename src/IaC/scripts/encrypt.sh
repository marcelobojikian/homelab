#!/usr/bin/env bash

FOLDER=$1
VAULT_FILE=$2

echo Encrypt proxmox folder
for var_file in $FOLDER/group_vars/*/vault*; do ansible-vault encrypt $var_file --vault-password-file $VAULT_FILE; done

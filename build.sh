#!/usr/bin/env bash
##########################################################################
# Shellscript:	synopsis - Installs and prepare the project
# Author     :	Marcelo Nogueira <marcelo.bojikian@gmail.com>
# Date       :	2024-04-05
# Category   :	System Installer
##########################################################################
# Reference
# Gene       : https://github.com/marcelobojikian/homelab
##########################################################################
# Description
#   Download and Install the project to configure the proxmox.
#
##########################################################################

################################################# variables
readonly PROJECT_ROOT=https://github.com/marcelobojikian/homelab.git
readonly VAULT_FILE=dist/.myvaultkey
###########################################################

############################################## dependencies
for check in 'ansible-vault' 'ssh-keygen' 'docker' ; do
    if ! which "$check" &> /dev/null
        then echo "Must have $check installed" && exit 1
    fi
done
###########################################################

################################################# functions

log() { msg="${@:2}"; printf "$(date "+%Y-%m-%d %H:%M:%S") - [%s] - %s\n" "${1^^}" "${msg}"; }

setup() {
    
    rm -r dist
    mkdir -p dist

    echo 'mysecret' > $VAULT_FILE
    chmod 600 $VAULT_FILE

    mkdir -p dist/files/public-keys

    cp -r src/ansible/group_vars dist/group_vars
    cp -r src/ansible/host_vars dist/host_vars
    cp -r src/ansible/inventory dist/inventory
    cp -r src/ansible/resources dist/resources
    cp -r src/ansible/roles dist/roles

    cp src/ansible/docker-compose.yml dist/docker-compose.yml
    cp src/ansible/Dockerfile dist/Dockerfile

    cp src/ansible/ansible.cfg dist/ansible.cfg
    cp src/ansible/proxmox.yml dist/proxmox.yml
    cp src/ansible/node.yml dist/node.yml

}

vault() {


    echo Encrypt group_vars
    for var_file in dist/group_vars/*/vault*; do ansible-vault encrypt $var_file --vault-password-file $VAULT_FILE; done

    echo Encrypt host_vars
    for var_file in dist/host_vars/*; do ansible-vault encrypt $var_file --vault-password-file $VAULT_FILE; done

    echo Encrypt inventory
    for var_file in dist/inventory/*; do ansible-vault encrypt $var_file --vault-password-file $VAULT_FILE; done

}

build(){

    echo Generate ssh keys
    ssh-keygen -q -t ed25519 -f "dist/files/ansible-key" -N ""

    mv dist/files/ansible-key.pub dist/files/public-keys/ansible-key.pub

    cd dist
    sudo docker-compose build

}
###########################################################

################################################# Principal
log info Build Home Lab 
setup
vault
build
log info Build completa
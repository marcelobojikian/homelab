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
###########################################################

############################################## dependencies
for check in 'python3' 'git' 'ssh-keygen' ; do
    if ! which "$check" &> /dev/null
        then echo "Must have $check installed" && exit 1
    fi
done
###########################################################

################################################# functions

log() { msg="${@:2}"; printf "$(date "+%Y-%m-%d %H:%M:%S") - [%s] - %s\n" "${1^^}" "${msg}"; }

setup() {

    sudo apt update -y
    sudo apt install python3-venv -y
    sudo apt install python3-pip -y

}

download() {
    git clone $PROJECT_ROOT
}

install(){

    cd homelab

    python3 -m venv venv
    source venv/bin/activate

    pip install ansible-core

    cd src/ansible/admin

    ansible-playbook setup.yml
    
    deactivate
}
###########################################################

################################################# Principal
log info Instalando Home Lab 
setup
download
install
log info Instalacao completa
FROM semaphoreui/semaphore:v2.9.64

WORKDIR /opt/ansible

COPY files ./files
COPY group_vars ./group_vars
COPY host_vars ./host_vars
COPY inventory ./inventory
COPY resources ./resources
COPY roles ./roles

USER root 
RUN chmod g+w files/

USER semaphore

COPY ansible.cfg .
COPY proxmox.yml .
COPY nodes.yml .

EXPOSE 3000








# FROM semaphoreui/semaphore:v2.9.64

# WORKDIR /opt/ansible

# COPY . .

# ARG TOKENS_PATH=proxmox/files/.vaultkey
# ARG PUBLIC_KEYS_PATH=proxmox/files/public-keys

# ENV ANSIBLE_VAULT_PASSWORD_FILE=proxmox/files/.vaultkey
# ENV ANSIBLE_PRIVATE_KEY_FILE=proxmox/files/ansible-key

# ARG PVE_SSH_USER=
# ARG PVE_SSH_PASS=

# ENV PVE_SSH_USER=$PVE_SSH_USER
# ENV PVE_SSH_PASS=$PVE_SSH_PASS

# EXPOSE 3000


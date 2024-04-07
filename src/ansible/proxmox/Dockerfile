FROM semaphoreui/semaphore:v2.9.64

WORKDIR /opt/ansible

COPY group_vars ./group_vars
COPY roles ./roles
COPY ansible.cfg .
COPY playbook.yml .

EXPOSE 3000
FROM semaphoreui/semaphore:v2.9.64

WORKDIR /opt/ansible

COPY files ./files
COPY collections ./collections
COPY group_vars ./group_vars
COPY host_vars ./host_vars
COPY inventory ./inventory
COPY resources ./resources
COPY roles ./roles

USER root 
RUN chmod g+w files/
RUN chmod g+w collections/

USER semaphore

COPY ansible.cfg .
COPY proxmox.yml .
COPY node.yml .

EXPOSE 3000

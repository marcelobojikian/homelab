FROM semaphoreui/semaphore:v2.9.64

WORKDIR /opt/ansible

COPY proxmox ./proxmox
COPY module /home/semaphore

USER root 
RUN chmod g+w proxmox/collections/

RUN chown -R semaphore: /home/semaphore/

USER semaphore

VOLUME /home/semaphore

EXPOSE 3000

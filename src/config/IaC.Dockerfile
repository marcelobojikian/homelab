FROM semaphoreui/semaphore:v2.9.64

WORKDIR /opt/ansible

USER root 

COPY module/resources /home/semaphore/module/resources
COPY module/security /home/semaphore/module/security

COPY IaC/proxmox ./iac
RUN chown -R semaphore: ./iac

RUN chown -R semaphore: /home/semaphore/

USER semaphore

VOLUME /home/semaphore

EXPOSE 3000

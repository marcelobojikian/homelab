
dev_mode:
	chmod g+r proxmox/group_vars/all/vault.yml
	chmod g+r proxmox/group_vars/node/vault.yml
	chmod g+r proxmox/group_vars/proxmox/vault.yml

encrypt:
	./scripts/encrypt.sh proxmox ../module/security/vault/production.key

decrypt:
	./scripts/decrypt.sh proxmox ../module/security/vault/production.key

up:
	sudo docker-compose up -d

down:
	sudo docker-compose down

it:
	sudo docker-compose exec homelab-iac sh

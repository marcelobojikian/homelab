
ENV ?= production
-include .env
-include .env.$(ENV)
export

init:
	@terraform init

plan:
	@terraform plan \
	-var="ansible_path=$(PAS_ANSIBLE_PATH)" \
	-var="security_path=$(PAS_MODULE)/security" \
	-var-file="$(PAS_TF_MODULE)/module.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/dns.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/proxmox.tfvars.json"

apply:
	@terraform apply \
	-var="ansible_path=$(PAS_ANSIBLE_PATH)" \
	-var="security_path=$(PAS_MODULE)/security" \
	-var-file="$(PAS_TF_MODULE)/module.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/dns.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/proxmox.tfvars.json"

destroy:
	@terraform destroy \
	-var="ansible_path=$(PAS_ANSIBLE_PATH)" \
	-var="security_path=$(PAS_MODULE)/security" \
	-var-file="$(PAS_TF_MODULE)/module.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/dns.tfvars.json" \
	-var-file="$(PAS_TF_MODULE)/proxmox.tfvars.json"

console:
	terraform console

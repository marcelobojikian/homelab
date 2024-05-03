
terraform {
  required_version = ">= 1.8.0"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
    dns = {
      source  = "hashicorp/dns"
      version = "3.4.0"
    }
    ansible = {
      version = "~> 1.2.0"
      source  = "ansible/ansible"
    }
  }
}

provider "proxmox" {

  pm_api_url          = module.proxmox.api_url
  pm_api_token_id     = module.proxmox.api_token_id
  pm_api_token_secret = module.proxmox.api_token_secret

  pm_tls_insecure = true

}

provider "dns" {
  update {
    server        = module.dns.ip
    key_name      = module.dns.key_name
    key_algorithm = module.dns.key_algorithm
    key_secret    = module.dns.tsig_secret
  }
}

provider "ansible" {}

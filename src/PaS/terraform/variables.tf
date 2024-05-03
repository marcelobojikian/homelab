
variable "ansible_path" {
  type = string
}

variable "security_path" {
  type = string
}

variable "module" {
  type = object({
    dns = object({
      key_name      = string
      key_algorithm = string
      domain_name   = string
    })
    machine = object({
      mode       = string
      template   = string
      gateway    = string
      cloud_init = string
    })
    proxmox = object({
      server_port = string
    })
  })
}

variable "proxmox" {
  type = object({
    ip             = string
    api_user       = string
    api_token_id   = string
    api_token_file = string
  })
}

variable "dns" {
  type = object({
    ip        = string
    tsig_file = string
  })
}

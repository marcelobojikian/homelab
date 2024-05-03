module "machine" {
  source     = "../modules/machine"
  type       = var.vm_type
  public_ip  = var.vm_public_ip
  mode       = local.default_machine.mode
  template   = local.default_machine.template
  gateway    = local.default_machine.gateway
  cloud_init = local.default_machine.cloud_init
}

module "proxmox" {
  source         = "../modules/proxmox"
  server_ip      = local.proxmox.ip
  server_port    = local.default_proxmox.server_port
  api_user       = local.proxmox.api_user
  api_token_id   = local.proxmox.api_token_id
  api_token_file = "${local.security_path}/${local.proxmox.api_token_file}"
}

module "dns" {
  source        = "../modules/dns"
  ip            = local.dns.ip
  tsig_file     = "${local.security_path}/${local.dns.tsig_file}"
  key_name      = local.default_dns.key_name
  key_algorithm = local.default_dns.key_algorithm
  domain_name   = local.default_dns.domain_name
}

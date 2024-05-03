locals {

  # Paths
  project_path   = dirname(abspath(path.root))
  PaS_config_dir = "${local.project_path}/.PaS"

  # Default value
  default_module = jsondecode(file("${local.PaS_config_dir}/module.json"))

  # Configs
  env_config = jsondecode(file("${local.PaS_config_dir}/env.json"))

  # Short vars default
  default_machine = local.default_module.machine
  default_proxmox = local.default_module.proxmox
  default_dns     = local.default_module.dns

  # Short vars ENV
  security_path = local.env_config.security_path
  proxmox       = local.env_config.proxmox
  dns           = local.env_config.dns

}

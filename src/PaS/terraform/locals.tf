locals {

  # Paths
  project_path   = abspath(path.root)
  PaS_config_dir = "${local.project_path}/.PaS"

  # Configs
  env_config_file    = "${local.PaS_config_dir}/env.json"
  module_config_file = "${local.PaS_config_dir}/module.json"
  
}

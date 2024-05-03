resource "local_file" "module_config" {
    content = jsonencode(var.module)
    filename = "${local.module_config_file}"
    file_permission = "0600"  
}

resource "local_file" "PaS_config" {
    content = jsonencode({
        "ansible_path": var.ansible_path
        "security_path": var.security_path
        "proxmox": var.proxmox
        "dns": var.dns
    })
    filename = "${local.env_config_file}"
    file_permission = "0600"  
}
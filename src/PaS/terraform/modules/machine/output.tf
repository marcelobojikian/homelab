output "cores" {
  value = local.types[var.type]["cores"]
}
output "memory" {
  value = local.types[var.type]["memory"]
}
output "disk_size" {
  value = local.types[var.type]["disk_size"]
}

output "cpu" {
  value = local.modes[var.mode]["cpu"]
}
output "kvm" {
  value = local.modes[var.mode]["kvm"]
}

output "ipconfig0" {
  value = var.public_ip != "dhcp" ? "ip=${var.public_ip}/24,gw=${var.gateway}" : "ip=dhcp"
}

output "cicustom" {
  value = "user=ansible:snippets/${var.cloud_init}"
}

output "template" {
  value = local.templates[var.template]
}
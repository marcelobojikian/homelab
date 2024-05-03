
output "ip" {
  value = var.ip
}

output "zone" {
  value = "${var.domain_name}."
}

output "domain_name" {
  value = var.domain_name
}

output "key_name" {
  value = var.key_name
}

output "key_algorithm" {
  value = var.key_algorithm
}

output "tsig_secret" {
  value     = data.local_file.tsig_secret.content
  sensitive = true
}

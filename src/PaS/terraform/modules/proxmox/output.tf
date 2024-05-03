output "api_url" {
  value = "https://${var.server_ip}:${var.server_port}/api2/json"
}

output "api_token_id" {
  value = "${var.api_user}!${var.api_token_id}"
  sensitive = true
}

output "api_token_secret" {
  value = data.local_file.token_secret.content
  sensitive = true
}

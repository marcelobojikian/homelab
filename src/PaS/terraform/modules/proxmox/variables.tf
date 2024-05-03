
variable "server_ip" {
  type    = string
}

variable "server_port" {
  type    = string
}

variable "api_token_file" {
  type    = string
}

variable "api_user" {
  type    = string
}

variable "api_token_id" {
  type    = string
  sensitive = true
}


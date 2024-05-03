
variable "vm_id" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_type" {
  type = string
}

variable "vm_public_ip" {
  default = "dhcp"
  type    = string
}

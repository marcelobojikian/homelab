
resource "dns_a_record_set" "dns_example" {
  zone      = module.dns.zone
  name      = var.vm_name
  addresses = [var.vm_public_ip]
}

resource "dns_a_record_set" "dns_example_subdomain" {
  zone      = module.dns.zone
  name      = "*.${var.vm_name}"
  addresses = [var.vm_public_ip]
}

resource "proxmox_vm_qemu" "example" {

  vmid      = var.vm_id
  name      = var.vm_name
  cores     = module.machine.cores
  memory    = module.machine.memory
  ipconfig0 = module.machine.ipconfig0

  cicustom = module.machine.cicustom
  qemu_os  = "other"

  target_node = "pve"
  cpu         = module.machine.cpu
  scsihw      = "virtio-scsi-single"
  os_type     = "cloud-init"

  clone  = module.machine.template
  onboot = true

  agent   = 1
  kvm     = module.machine.kvm
  sockets = 1

  disks {
    scsi {
      scsi0 {
        disk {
          size       = module.machine.disk_size
          storage    = "local-lvm"
          iothread   = true
          discard    = true
          emulatessd = true
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  cloudinit_cdrom_storage = "local-lvm"

}

resource "ansible_host" "host" {
  name   = "${var.vm_name}.${module.dns.domain_name}"
  groups = ["${var.vm_name}"]

  variables = {
    ansible_host = var.vm_public_ip
  }
}

resource "ansible_group" "group" {
  name = var.vm_name
  variables = {
    server_cache_ip = var.vm_public_ip
  }
}

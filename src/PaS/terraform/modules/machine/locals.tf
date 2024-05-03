locals {
  types = {
    "nano"   = local.types_desc["1xCPU-512MB-16GB"]
    "micro"  = local.types_desc["1xCPU-1GB-32GB"]
    "small"  = local.types_desc["1xCPU-2GB-32GB"]
    "medium" = local.types_desc["2xCPU-4GB-64GB"]
  }
  types_desc = {
    "1xCPU-512MB-16GB" = {
      "cores"     = 1
      "memory"    = 512
      "disk_size" = 16
    }
    "1xCPU-1GB-32GB" = {
      "cores"     = 1
      "memory"    = 1024
      "disk_size" = 32
    }
    "1xCPU-2GB-32GB" = {
      "cores"     = 1
      "memory"    = 2048
      "disk_size" = 32
    }
    "2xCPU-4GB-64GB" = {
      "cores"     = 2
      "memory"    = 4096
      "disk_size" = 64
    }
  }
  modes = {
    "default" = {
      "cpu" = "kvm64"
      "kvm" = false
    }
    "host" = {
      "cpu" = "host"
      "kvm" = true
    }
  }
  templates = {
    "debian-bullseye" = "debian-11"
    "debian-bookworm" = "debian-12"
    "ubuntu-bionic"   = "ubuntu-1804"
    "ubuntu-focal"    = "ubuntu-2004"
    "ubuntu-jammy"    = "ubuntu-2204"
    "ubuntu-mantic"   = "ubuntu-2310"
    "ubuntu-noble"    = "ubuntu-2404"
  }
}

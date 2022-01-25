#variable "variable_name" {
#   type = string
#   default = ""
#   description = ""
# }

variable "lxc_name" {
  type = string
  description = "Proxmox LXC instance name"
}

variable "env" {
  type = string
  description = "Proxmox LXC environnement (prod|lab|iot|mngt)"
  default = "lab"
}

variable "distro" {
  type = string
  description = "LXC distribution (alpine|ubu20|deb11)"
  default = "ubu20"
}


variable "template" {
  type = map
  description = "LXC template"
  default = {
    "alpine"  = "alpine-3.15-default_20211202_amd64.tar.xz"
    "ubu20" = "ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
    "deb11" = "debian-11-standard_11.0-1_amd64.tar.gz"
  }
}

variable "net_env" {
  type = map
  description = "Proxmox network name"
  default = {
    "prod"  = "vmbr10"
    "lab" = "vmbr99"
    "iot" = "vmbr90"
    "mngt" = "vmbr0"
  }
}

variable "ssh_public_keys" {
  type = string
  default = ""
  description = "lxc public key"
}


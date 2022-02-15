#variable "variable_name" {
#   type = string
#   default = ""
#   description = ""
# }

variable "lxc_name" {
  type = string
  description = "Proxmox LXC instance name"
}

variable "playbook" {
  type = string
  description = "Ansible playbook"
  default = ""
}

variable "target_node" {
  type = string
  description = "Proxmox LXC host (pve|pve2|pve4)"
  default = "pve4"
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

variable "cpu_core" {
  type = number
  description = "LXC number of cpu core (default 2)"
  default = 2
}

variable "memory" {
  type = number
  description = "LXC memory size (default 2048)"
  default = 2048
}


variable "disk_size" {
  type = string
  description = "LXC disk size (default 8G)"
  default = "8G"
}

variable "unprivileged" {
  type = bool
  description = "Is container is unprivileged"
  default = true
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

variable "user" {
  type = map
  description = "LXC default user"
  default = {
    "alpine"  = "root"
    "ubu20" = "root"
    "deb11" = "root"
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


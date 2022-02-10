#variable "variable_name" {
#   type = string
#   default = ""
#   description = ""
# }

variable "vm_name" {
  type = string
  description = "Proxmox VM instance name"
}

variable "playbook" {
  type = string
  description = "Ansible playbook"
  default = ""
}

variable "env" {
  type = string
  description = "Proxmox VM environnement (prod|lab|iot|mngt)"
  default = "lab"
}

variable "template" {
  type = map
  description = "VM template"
  default = {
    "dummy"  = "dummy.ovha"
  }
}

variable "user" {
  type = map
  description = "VM user"
  default = {
    "alpine"  = "root"
    "ubu20" = "ubuntu"
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
  description = "VM public key"
}
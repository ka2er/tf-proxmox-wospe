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

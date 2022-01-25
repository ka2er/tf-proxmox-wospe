variable "user" {
  type = string
  default = ""
  description = "Proxmix API user"
}

variable "password" {
  type = string
  default = ""
#  sensitive = true
  description = "Proxmix API password"
}

variable "token" {
  type = string
  default = ""
  description = "Proxmix API user"
}

variable "secret" {
  type = string
  default = ""
#  sensitive = true
  description = "Proxmix API password"
}

variable "api" {
  type = string
  default = ""
  description = "Proxmix API endpoint"
}

variable "ssh_key" {
  type = string
  default = ""
  description = "ADM ssh keys"
}




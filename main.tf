terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = var.api
  #pm_user = var.user
  #pm_password = var.password
  pm_api_token_id = var.token
  pm_api_token_secret = var.secret
  pm_debug = true
}

module "prox-lxc-graylog" {
    source = "./modules/proxmox_lxc"

    env = "prod"
    lxc_name = "graylog-todel"
}

module "prox-lxc-client" {
    source = "./modules/proxmox_lxc"

    env = "lab"
    lxc_name = "client-todel"
}


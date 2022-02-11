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

module "prox-lxc-rtl-433" {
    source = "./modules/proxmox_lxc"
    distro = "deb11"
    ssh_public_keys = var.ssh_key
    env = "iot"
    lxc_name = "rtl-433"
    playbook = "rtl-433.yml"
    target_node = "pve"
}

/*
module "prox-lxc-graylog" {
    source = "./modules/proxmox_lxc"
    distro = "ubu20"
    ssh_public_keys = var.ssh_key
    env = "prod"
    lxc_name = "graylog-todel"
}

module "prox-lxc-client" {
    source = "./modules/proxmox_lxc"
    distro = "alpine"
    env = "lab"
    lxc_name = "client-todel"
}
*/

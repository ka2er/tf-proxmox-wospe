terraform {
  required_providers {
   proxmox = {
      source = "telmate/proxmox"
    }
  }
}


resource "proxmox_lxc" "lxc" {
 # name = var.lxc_name

  features {
        nesting = true
#            mount   = "nfs;cifs"

    }
    hostname = "lxc-${var.env}-${var.distro}-${var.lxc_name}"
    network {
        name = "eth0"
        bridge = var.net_env[var.env] # management vmbr10 prod vmbr90 iot  vmbr99 lab
        ip = "dhcp"
    }
    ostemplate = "cephfs:vztmpl/${var.template[var.distro]}"
    password = "rootroot"
    target_node = "pve4"
    # size 8G ?
    cores = 2
    memory = "2048"

    #description
// Terraform will crash without rootfs defined
    rootfs {
      storage = "ceph_block" # ceph_data_ssd
      #storage = "local-zfs"
      size    = "8G"
    }

    unprivileged = true
    
    ssh_public_keys = var.ssh_public_keys

  start = true

}

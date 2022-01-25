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
    hostname = "lxc-${var.env}-${var.lxc_name}"
    network {
        name = "eth0"
        bridge = var.net_env[var.env] # management vmbr10 prod vmbr90 iot  vmbr99 lab
        ip = "dhcp"
    }
    ostemplate = "cephfs:vztmpl/alpine-3.15-default_20211202_amd64.tar.xz"
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

    #ssh-key

    #ssh_public_keys = <<-EOT
    #ssh-rsa <public_key_1> user@example.com
    #ssh-ed25519 <public_key_2> user@example.com
  #EOT

  start = true

}

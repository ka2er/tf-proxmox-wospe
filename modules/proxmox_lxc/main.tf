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
    #storage = "ceph_block" # ceph_data_ssd
    storage = "ceph_data_ssd"
    #storage = "local-zfs"
    size    = "8G"
  }

  unprivileged = true

  #ssh-key
  ssh_public_keys = var.ssh_public_keys
  #ssh-rsa <public_key_1> user@example.com
  #ssh-ed25519 <public_key_2> user@example.com
  #EOT

  start = true

#TODO if playbook is set call this ...

  # on veut recuperer l'id du container pour interroger ces infos
  # pve4/lxc/128 => 128 
  #lxc_id = split("/", self.id)[2]
  provisioner "local-exec" {
#    command = "sleep 10 && ssh ${self.target_node} lxc-info ${split("/", self.id)[2]} > net-${split("/", self.id)[2]}"
    command = "${path.module}/tf-ansible-lxc-bootstrap.sh ${self.id} ${var.playbook} ${var.user[var.distro]}"
  }

}

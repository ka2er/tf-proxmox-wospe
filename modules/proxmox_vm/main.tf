terraform {
  required_providers {
   proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {

  name        = "vm-TODEL"
  target_node = "pve4"
  iso         = "cephfs:iso/AlienVault_OSSIM_64bits.iso"
  #os_type = "l26"

  bios = "ovmf" # seabios | ovmf

  onboot = true
  #oncreate = true
  tablet = false
  #agent = 1 # qemu-guest-agent
  cores = 2
  memory = 2048
  scsihw = "virtio-scsi-pci"
##########

  network {
    bridge = "vmbr90"
    model = "virtio"
  }

  disk {
    // This disk will become scsi0
    type = "virtio"
    storage = "ceph_block_ssd"
    size = "10G"
    //<arguments omitted for brevity...>
  }

}

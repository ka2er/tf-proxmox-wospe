#output "lxc-id" {
#  description = "ID of new LXC"
#  value       = module.proxmox_lxc.lxc.id
#}


output "lxc-ip" {
  description = "IP of new LXC"
  value       = proxmox_lxc.lxc.network[0].ip
}

output "lxc-id" {
  description = "ID of new LXC"
  value       = proxmox_lxc.lxc.id
}

output "lxc-net" {
  description = "Network of new LXC"
  value       = proxmox_lxc.lxc.network
}
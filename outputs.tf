output "ssh_host" {
  value = [for vm in proxmox_vm_qemu.rancher : vm.ssh_host]
}

output "ssh_port" {
  value = [for vm in proxmox_vm_qemu.rancher : vm.ssh_port]
}

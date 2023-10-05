module "example-vm" {
  source = "git::https://github.com/cdryzun/terraform-proxmox-vm-collection.git//?ref=main"
  groups = {
    example-vm-9 = {
      desc              = "example vm"
      target_node       = "amd"
      onboot            = true
      target_clone_name = "centos7"
      pool              = "devops"
      cores             = "2"
      memory            = "2048"
      ip                = "192.168.8.9"
      ip_gw             = "192.168.8.1"
      dns               = "192.168.8.1"
      disk_size         = "40G"
      storage           = "local-lvm"
      ip_subnet         = "24"
    }
  }
}

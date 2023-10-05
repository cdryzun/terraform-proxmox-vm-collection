
locals {
  tags = {
    terraform        = "true"
    terraform_code   = "https://github.com/Telmate/terraform-provider-proxmox"
    terraform_module = "terraform-provider-proxmox"
  }


  group_info = flatten([for group_k, group_v in var.groups : [{
    target_node       = group_v.target_node
    name              = "${group_k}"
    pool              = group_v.pool
    desc              = group_v.desc
    cores             = group_v.cores
    memory            = group_v.memory
    ip                = group_v.ip
    ip_gw             = group_v.ip_gw
    target_clone_name = group_v.target_clone_name
    dns               = group_v.dns
    disk_size         = group_v.disk_size
    storage           = group_v.storage
    onboot            = group_v.onboot
    ip_subnet         = group_v.ip_subnet
  }]])
}



# Proxmox  terraform module for vm

> The Proxmox Virtual Environment terraform module is used to quickly clone virtual machine templates based on demand. This module uses the Telmate/proxmox provider for implementation.



# Variables

## input

> This module accept the following variables as input:

```bash
variable "groups" {
  type = map(object({
    desc              = string
    target_node       = string
    target_clone_name = string
    pool              = string
    cores             = string
    memory            = string
    ip                = string
    ip_gw             = string
    dns               = string
    disk_size         = string
    storage           = string
    onboot            = bool
  }))
}
```

**Examples**

```bash
module "example-vm" {
  source = "git::https://github.com/cdryzun/terraform-proxmox-vm-collection.git//?ref=main"
  groups = {
    example-vm-8 = {
      desc              = "example vm"
      target_node       = "dell-r710"
      onboot            = true
      target_clone_name = "centos7"
      pool              = "devops"
      cores             = "2"
      memory            = "2048"
      ip                = "192.168.8.8"
      ip_gw             = "192.168.8.1"
      dns               = "192.168.8.1"
      disk_size         = "40G"
      storage           = "local-lvm"
      ip_subnet         = "24"
    }
  }
}
```



# Usage


1. Generate SSH public and private keys.

   ```bash
   ssh-keygen -b 2048 -t rsa -f ./id_rsa -q -N ""
   ```

2. Configure environment variables.

   ```bash
   export PM_API_URL=https://xxx:8006/api2/json
   export PM_USER=root@pam
   export PM_PASS='xxx'
   ```

3. Plan & apply

   ```bash
   terraform init 
   
   terraform plan
   
   terraform apply -auto-approve
   ```

   



resource "proxmox_vm_qemu" "rancher" {
  for_each               = { for k, v in local.group_info : v.name => v }
  name                   = each.value.name
  desc                   = each.value.desc
  target_node            = each.value.target_node
  pool                   = each.value.pool
  clone                  = each.value.target_clone_name
  agent                  = 1
  os_type                = "cloud-init"
  cores                  = each.value.cores
  sockets                = 1
  cpu                    = "host"
  memory                 = each.value.memory
  onboot                 = each.value.onboot
  define_connection_info = true
  ipconfig0              = "ip=${each.value.ip}/${each.value.ip_subnet},gw=${each.value.ip_gw}"
  nameserver             = each.value.dns
  disk {
    size     = each.value.disk_size
    type     = "scsi" # scsi、 ide 、 sata 、 virtio
    storage  = each.value.storage
    iothread = 0
    ssd      = 1
    discard  = "on"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  sshkeys         = file("${path.root}/id_rsa.pub")
  ssh_private_key = file("${path.root}/id_rsa")

  connection {
    type        = "ssh"
    user        = self.ssh_user
    private_key = self.ssh_private_key
    host        = self.ssh_host
    port        = self.ssh_port
  }

  provisioner "remote-exec" {
    inline = [
      "hostnamectl set-hostname ${self.name}",
      "ip a"
    ]
  }
  timeouts {
    create = "2m"
  }
}

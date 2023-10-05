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
    ip_subnet         = string
    dns               = string
    disk_size         = string
    storage           = string
    onboot            = bool
  }))
  default     = {}
  description = "Add VM to be created within the group"
}

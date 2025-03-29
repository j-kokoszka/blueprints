variable "ssh_host" {
  description = "The SSH host for cloud-init file upload"
  type        = string
}

variable "ssh_user" {
  description = "The SSH user for cloud-init file upload"
  type        = string
  default     = "root"  # Optional: set a default value
}

variable "servers" {
  type = map(object({
    name         = string   # VM name #
    desc         = string   # VM description #
    vmid         = string   # Unique VM ID in Proxmox #
    target_node  = string   # Proxmox node where the VM will be created #
    cpu_cores    = number   # Number of CPU cores #
    mem          = number   # Amount of RAM in MB #
    disk_size    = string   # Disk size (e.g., "50G") #
    template     = string   # Template name for the VM #
    tags         = string   # Tags for categorization #
    storage      = string   # Storage backend (e.g., "cephfs") #
    nameserver   = string   # DNS nameserver for the VM #
    cicustom     = string   # Custom Cloud-init configuration file (e.g., "user-data.yaml") #

    interface0 = object({
      ipconfig   = string   # IP configuration (e.g., "ip=192.168.1.100/24,gw=192.168.1.1") #
      bridge     = string   # Network bridge to use (e.g., "vmbr0") #
      mac        = optional(string)  # Optional MAC address #
      vlan       = optional(number)  # Optional VLAN ID #
      rate       = optional(number)  # Optional network rate limit #
    })
  }))
}

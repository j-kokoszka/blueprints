resource "proxmox_vm_qemu" "pgrnd_jaok_mgr" {
  for_each = var.servers

  # VM General Settings
  target_node = each.value.target_node
  vmid        = each.value.vmid
  name        = each.value.name
  desc        = each.value.desc
  tags        = each.value.tags

  # VM Advanced General Settings
  onboot = false

  # VM OS Settings
  clone = each.value.template
  full_clone = true

  # VM System Settings - set to 1 if the image has the agent installed
  agent = 1

  # VM CPU Settings
  cores    = each.value.cpu_cores
  sockets  = 1
  cpu_type = "host"

  # VM Memory Settings
  memory  = each.value.mem
  balloon = 0

  # Disk and Controller Settings
  scsihw = "virtio-scsi-pci"

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = each.value.storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = each.value.storage
          size    = each.value.disk_size
        }
      }
    }
  }

  # Network Settings
  network {
    id     = 0
    model  = "virtio"
    bridge = each.value.interface0.bridge
  }


  # VM Cloud-Init Settings
  os_type   = "cloud-init"
  nameserver  = each.value.nameserver

  ipconfig0 = each.value.interface0.ipconfig

  cicustom = "${each.value.cicustom}"
}

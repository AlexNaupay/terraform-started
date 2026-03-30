resource "proxmox_virtual_environment_vm" "debian_vm" {
  # depends_on = [null_resource.debian_template]

  name      = "debian-tf-01"   # nombre descriptivo
  node_name = var.proxmox_node
  #vm_id     = 200

  clone {
    vm_id = 9000
    full  = true
  }

  cpu {
    cores = 1
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 1024
  }

  agent {
    enabled = false
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "virtio0"
    size         = 20
    discard      = "on"
    iothread     = true
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.18.182/24"
        gateway = "192.168.18.1"
      }
    }

    dns {
      servers = ["8.8.8.8", "1.1.1.1"]
    }

    user_account {
      username = "debian"    # 3 usuario por defecto en Debian cloud es "debian"
      keys     = [trimspace(var.vm_ssh_public_key)]
    }
  }

  boot_order      = ["virtio0"]
  on_boot         = true
  stop_on_destroy = true
}
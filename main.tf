terraform {
  required_providers {
    proxmox = {
      source  = "loeken/proxmox"
      version = ">=1.0.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test_vm" {
  count = var.vm_count
  name        = "test-vm-${count.index + 1}"
  target_node = var.pm_node
  vmid        = 9000 + count.index
  cores       = 1
  memory      = 512
  scsihw      = "virtio-scsi-pci"

  disk {
    size    = "8G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  iso        = "local:iso/debian-12.10.0-amd64-netinst.iso"
  boot       = "cdn"
  onboot     = true
}
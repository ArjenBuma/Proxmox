variable "pm_api_url" {
  type        = string
  description = "Proxmox API URL"
}

variable "pm_user" {
  type        = string
  description = "Proxmox username (e.g. root@pam)"
}

variable "pm_password" {
  type        = string
  description = "Proxmox password"
}

variable "pm_node" {
  type        = string
  description = "Proxmox node name (e.g. proxmox)"
}

variable "vm_count" {
  type        = number
  description = "Aantal VMs om aan te maken"
  default     = 3
}

variable "base_vmid" {
  type        = number
  description = "Startnummer voor VMID (elke VM krijgt vmid = base_vmid + index)"
  default     = 9000
}

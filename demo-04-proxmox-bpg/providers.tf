terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.100.0"
    }
  }
}

# ─── Provider ─────────────────────────────────────────────────────────────────
provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true  # certificados autofirmados

  ssh {
    agent    = true  # usa el agente SSH local (ssh-add)
    username = var.proxmox_ssh_username
  }
}
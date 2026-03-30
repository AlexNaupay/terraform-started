terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url  = var.proxmox_api
  pm_user     = var.proxmox_user # Change this if you're using a different user
  pm_password = var.proxmox_password
  #pm_api_token_id     = var.proxmox_api_token_id
  #pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true # Use 'true' if you have self-signed certificates
}

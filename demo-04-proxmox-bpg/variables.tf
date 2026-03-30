variable "proxmox_endpoint" {
  description = "URL de la API de Proxmox"
  type        = string
}

variable "proxmox_api_token" {
  description = "API Token en formato 'user@realm!tokenid=secret'"
  type        = string
  sensitive   = true
}

variable "proxmox_ssh_username" {
  description = "Usuario SSH para el nodo"
  type        = string
  default     = "root"
}

variable "proxmox_node" {
  description = "Nombre del nodo Proxmox"
  type        = string
  default     = "pve"
}

variable "vm_ssh_public_key" {
  description = "Clave pública SSH para acceder a la VM creada"
  type        = string
}
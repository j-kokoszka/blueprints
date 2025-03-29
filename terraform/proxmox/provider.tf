terraform {
    required_version = ">= 0.13.0"
    required_providers {
        proxmox = {
          source = "Telmate/proxmox"
          version = "3.0.1-rc6"
        }
    }
}

provider "proxmox" {
  # Provided in env variables
  # pm_api_url = var.proxmox_api_url
  # pm_api_token_id = var.proxmox_api_token_id
  # pm_api_token_secret = var.proxmox_api_token_secret
  
  # Logging configuration
  pm_log_enable = true
  pm_log_file = ".terraform-plugin-proxmox.log"
  pm_debug = false
  pm_log_levels = {
      _default = "info"
      _capturelog = ""
  }
  
  # (Optional) Skip TLS Verification
  pm_tls_insecure = true
}

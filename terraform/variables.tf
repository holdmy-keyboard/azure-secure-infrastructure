variable "subscription_id" {
  description = "Azure subscription ID used for deployment"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Central US"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "azure-secure-infra"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vnet_address_space" {
  description = "Address space used by the Azure Virtual Network"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "web_subnet_prefix" {
  description = "Address range used by the web subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "admin_ip_cidr" {
  description = "Public IP address allowed to connect through SSH"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size used by the web server"
  type        = string
  default     = "Standard_B2pts_v2"
}

variable "admin_username" {
  description = "Administrator username for the Linux VM"
  type        = string
  default     = "azueruser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key used for VM authentication"
  type        = string
  default     = "~/.ssh/azure_secure_infra.pub"
}

variable "alert_email" {
  description = "Email address that receives Azure Monitor alert notifications"
  type        = string
  sensitive   = true
}
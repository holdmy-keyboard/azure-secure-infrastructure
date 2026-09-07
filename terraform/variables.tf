variable "subscription_id" {
  description = "Azure subscription ID used for deployment"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Germany West Central"
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
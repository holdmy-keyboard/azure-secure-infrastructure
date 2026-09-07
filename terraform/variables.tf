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

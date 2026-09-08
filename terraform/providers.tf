provider "azurerm" {
  features {}

  subscription_id = var.subscription_id

  # Register the Azure services this project needs before planning or applying.
  resource_provider_registrations = "none"
  resource_providers_to_register = [
    "Microsoft.Compute",
    "Microsoft.Network",
  ]
}

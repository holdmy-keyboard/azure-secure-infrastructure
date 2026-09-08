resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name               = "AzureMonitorLinuxAgent"
  virtual_machine_id = azurerm_linux_virtual_machine.web.id

  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.0"

  auto_upgrade_minor_version = true

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule" "linux" {
  name                = "dcr-linux-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  kind = "Linux"

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.main.id
      name                  = "log-analytics"
    }
  }

  data_sources {
    performance_counter {
      streams = [
        "Microsoft-Perf"
      ]

      sampling_frequency_in_seconds = 60

      counter_specifiers = [
        "\\Processor(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes",
        "\\LogicalDisk(_Total)\\% Free Space"
      ]

      name = "linux-performance"
    }

    syslog {
      facility_names = [
        "auth",
        "authpriv",
        "daemon",
        "syslog",
        "user"
      ]

      log_levels = [
        "Info",
        "Notice",
        "Warning",
        "Error",
        "Critical",
        "Alert",
        "Emergency"
      ]

      streams = [
        "Microsoft-Syslog"
      ]

      name = "linux-syslog"
    }
  }

  data_flow {
    streams = [
      "Microsoft-Perf",
      "Microsoft-Syslog"
    ]

    destinations = [
      "log-analytics"
    ]
  }

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule_association" "web" {
  name = "dcra-web-${var.environment}"

  target_resource_id      = azurerm_linux_virtual_machine.web.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.linux.id

  description = "Monitoring configuration for the Azure web VM"

  depends_on = [
    azurerm_virtual_machine_extension.azure_monitor_agent
  ]
}
resource "azurerm_monitor_action_group" "main" {
  name                = "ag-web-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "webalerts"

  email_receiver {
    name                    = "cloud-admin"
    email_address           = var.alert_email
    use_common_alert_schema = true
  }

  tags = local.common_tags
}

resource "azurerm_monitor_metric_alert" "high_cpu" {
  name                = "alert-high-cpu-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name

  scopes = [
    azurerm_linux_virtual_machine.web.id
  ]

  description = "Alert when average VM CPU usage exceeds 80 percent for 5 minutes."

  severity      = 2
  enabled       = true
  auto_mitigate = true

  frequency   = "PT1M"
  window_size = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = local.common_tags
}
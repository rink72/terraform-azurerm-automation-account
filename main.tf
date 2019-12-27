terraform {
  required_version = ">= 0.12.0"
}

# A special variable used to pass in dependencies to the module
variable "aa_depends_on" {
  type        = any
  description = "A special variable used to pass in dependencies to the module"
  default     = null
}

resource "azurerm_automation_account" "auto_account" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tags = var.tags

  # Check if there are any dependencies required
  depends_on = [
    var.aa_depends_on
  ]
}

module "diagnostic-setting" {
  source  = "rink72/diagnostic-setting/azurerm"
  version = "1.0.1"


  name                       = var.name
  enable                     = var.enable_diagnostics
  target_resource_id         = azurerm_automation_account.auto_account.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  diagnostic_logs            = var.diagnostic_logs
  diagnostic_metrics         = var.diagnostic_metrics

  # Make sure automation account is deployed before configuring automation
  ds_depends_on = [
    azurerm_automation_account.auto_account
  ]
}

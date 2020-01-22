output "id" {
  description = "The automation account resource id"
  value       = azurerm_automation_account.auto_account.id
}

output "endpoint" {
  description = "The automation account endpoint url"
  value       = azurerm_automation_account.auto_account.dsc_server_endpoint
}

output "primary_access_key" {
  description = "The automation account primary key"
  value       = azurerm_automation_account.auto_account.dsc_primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The automation account secondary key"
  value       = azurerm_automation_account.auto_account.dsc_secondary_access_key
  sensitive   = true
}

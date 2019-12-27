output "id" {
    description = "The automation account resource id"
    value = azurerm_automation_account.auto_account.id
}

output "endpoint" {
    description = "The automation account endpoint"
    value = azurerm_automation_account.auto_account.endpoint
}

output "primary_key" {
    description = "The automation account secondary key"
    value = azurerm_automation_account.auto_account.primary_key
    sensitive = true
}

output "secondary_key" {
    description = "The automation account secondary key"
    value = azurerm_automation_account.auto_account.secondary_key
    sensitive = true
}

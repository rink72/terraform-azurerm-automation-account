provider "azurerm" {
  version = ">= 1.39.0"
}

locals {
    location = "australiasoutheast"
    rg_name = "testing-rg-simple"
    name = "testing-aa"
}

# Get a random integer to provide a unique Log Analytics workspace name as they are globally unique
resource "random_integer" "la_id" {
  min     = 10000
  max     = 50000
}

# Create a resource group to deploy the log analytics workspace to
module "resource-group" {
  source  = "rink72/resource-group/azurerm"
  version = "1.0.0"
  
  name = local.rg_name
  location = local.locationS
}

# Create the automation account in the created resource group.
module "automation-account" {
  source = "../../"

  name = "${local.name}-${random_integer.la_id.result}"
  resource_group_name = module.resource-group.name
  location = local.location

  aa_depends_on = [
    module.resource-group
  ]
}
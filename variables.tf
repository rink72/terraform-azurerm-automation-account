variable "resource_group_name" {
    type = string
    description = "The name of the resource group to deploy the automation account in to."
}

variable "location" {
    type = string
    description = "The location to deploy the automation account in to."
}

variable "name" {
    type = string
    description = "The name of the automation account"
}

variable "sku_name" {
    type = string
    description = "The sku for the automation account. Only Basic is supported at this time."
    default = "Basic"
}

variable "tags" {
    type = map(string)
    description = "Tags to apply to the automation account and solutions."
    default = {}
}


# Diagnostic settings and metric settings that can be enabled. By default, we enable all
# and set to 30 days retention.
variable "diagnostic_logs" {
    type = list(object({ category = string, enabled = bool, retention_policy = object({ enabled = bool, days = number })}))
    description = "An array of diagnostic logs to configure."
    default = [
        {
            category = "JobLogs",
            enabled = true,
            retention_policy = {
                enabled = true,
                days = 30
            }
        },
        {
            category = "JobStreams",
            enabled = true,
            retention_policy = {
                enabled = true,
                days = 30
            }
        },
        {
            category = "DscNodeStatus",
            enabled = true,
            retention_policy = {
                enabled = true,
                days = 30
            }
        }
    ]
}

variable "diagnostic_metrics" {
    type = list(object({ category = string, enabled = bool, retention_policy = object({ enabled = bool, days = number })}))
    description = "An array of diagnostic metrics to configure."
    default = [
        {
            category = "AllMetrics",
            enabled = true,
            retention_policy = {
                enabled = true,
                days = 30
            }
        }
    ]
}

variable "enable_diagnostics" {
    type = bool
    description = "Should diagnostic logs for the resource be enabled."
    default = false
}

variable "log_analytics_workspace_id" {
    type = string
    description = "The log analytics workspace resource ID to use for diagnostic logs."
    default = null
}

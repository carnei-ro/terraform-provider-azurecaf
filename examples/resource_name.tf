terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.4"
    }
  }
}

provider "azurecaf" {

}

#Storage account test
resource "azurecaf_name" "classic_st" {
  name          = "log23"
  random_length = 5
  resource_type = "azurerm_storage_account"
  resource_types = [ "azurerm_cognitive_account", "azurerm_bot_web_app" ]
}

resource "azurecaf_name" "classic_st_randon" {
  name          = "log23"
  random_length = 5
  random_seed = 1
  resource_type = "azurerm_storage_account"
  resource_types = [ "azurerm_cognitive_account" ]
}

output "caf_name_classic_st" {
  value       = azurecaf_name.classic_st.result
  description = "Random result based on the resource type"
}

resource "azurecaf_name" "azurerm_cognitive_account" {
  name          = "cogsdemo"
  resource_type = "azurerm_cognitive_account"
  prefixes      = ["a", "z"]
  suffixes      = ["prod"]
  random_length = 5
  random_seed   = 123
  clean_input   = true
  separator     = "-"
}

output "azurerm_cognitive_account" {
  value       = azurecaf_name.azurerm_cognitive_account.result
  description = "Random result based on the resource type"
}

#Azure Open AI Deployment test
resource "azurecaf_name" "azurerm_cognitive_deployment" {
  name          = "openai-deployment"
  resource_type = "azurerm_cognitive_deployment"
  prefixes      = ["a", "b"]
  suffixes      = ["y", "z"]
  random_length = 5
  clean_input   = true
}

output "azurerm_cognitive_deployment" {
  value = azurecaf_name.azurerm_cognitive_deployment.result
  description = "Random result based on the resource type"
}

resource "azurecaf_name" "multiple_resources" {
  name           = "cogsdemo2"
  resource_type  = "azurerm_cognitive_account"
  resource_types = ["azurerm_storage_account"]
  prefixes       = ["a", "b"]
  suffixes       = ["prod"]
  random_length  = 4
  random_seed    = 123
  clean_input    = true
  separator      = "-"
}
data "azurecaf_name" "name_data" {
  name           = "cogsdemo2"
  resource_type  = "azurerm_cognitive_account"
  resource_types = ["azurerm_storage_account"]
  prefixes       = ["a", "b"]
  suffixes       = ["prod"]
  random_length  = 4
  random_seed    = 123
  clean_input    = true
  separator      = "-"
}

output "name_data" {
  value       = data.azurecaf_name.name_data.results
}

output "multiple_resources" {
  value = azurecaf_name.multiple_resources.results
}

output "multiple_resources_main" {
  value = azurecaf_name.multiple_resources.result
}

output "classic_st_random" {
  value = azurecaf_name.classic_st_randon.result
}
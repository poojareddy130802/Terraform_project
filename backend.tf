terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01689364RG"
    storage_account_name = "tfstaten01689364sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
 }

resource "azurerm_resource_group" "batch-rg" {
  name     = "testbatch"
  location = "West Europe"
}

resource "azurerm_batch_account" "batch" {
  name                 = "testbatchaccount"
  resource_group_name  = azurerm_resource_group.batch-rg.name
  location             = azurerm_resource_group.batch-rg.location
  pool_allocation_mode = "BatchService"

  tags = {
    env = "test"
    tobeDeletedForupdate = "DeleteThisTagAfter"
  }
}
    
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}


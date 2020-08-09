provider "azurerm" {
}

resource "azurerm_resource_group" "terraform_demo" {
  name     = "terraform-demo"
  location = "West Europe"
}


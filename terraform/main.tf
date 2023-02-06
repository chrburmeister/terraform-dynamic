locals {
    network_resource_group = "cbu-network-${var.environment}-rg"
    vnet_name = "cbu-network-${var.environment}-vnet"
}

resource "azurerm_resource_group" "network_resource_group" {
  name     = local.network_resource_group
  location = var.location
}

module "vnet" {
  source              = "./modules/virtual_network"
  location            = azurerm_resource_group.network_resource_group.location
  resource_group_name = azurerm_resource_group.network_resource_group.name
  name                = local.vnet_name
  dns_servers         = ["azure"]
  vnet_cidrs          = ["10.10.0.0/16"]
  subnets             = [
    {
        name           = "s1"
        address_prefix = "10.10.0.0/24"
        security_group = ""
    },
    {
        name           = "s2"
        address_prefix = "10.10.1.0/24"
        security_group = ""
    }
  ]
  tags                = {
    "environment" = var.environment 
  }
}
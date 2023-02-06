resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidrs
  dns_servers         = contains(var.dns_servers, "azure") ? null : var.dns_servers

  dynamic "subnet" {
    for_each = var.subnets

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group == "" ? null : subnet.value.source_addresses
    }
  }

  tags = var.tags
}

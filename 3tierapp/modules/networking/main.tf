# Networking resources
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "subnet" {
  count               = length(var.subnet_names)
  name                = var.subnet_names[count.index]
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidrs[count.index]]
  
  network_security_group_id = azurerm_network_security_group.security_group.id
}

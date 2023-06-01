# Security Group resources
resource "azurerm_network_security_group" "security_group" {
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

# Associate network security group with subnets
resource "azurerm_subnet_network_security_group_association" "attach-subnet" {
  count                    = length(var.subnet_id)
  subnet_id                 = var.subnet_id[count.index]
  network_security_group_id = azurerm_network_security_group.security_group.id
}

output "security_group_id" {
  value       = azurerm_network_security_group.security_group.id
}

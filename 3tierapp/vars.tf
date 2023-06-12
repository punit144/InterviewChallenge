variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "subnet_names" {
  type        = list(string)
}
variable "subnet_cidrs" {
  type        = list(string)
}
variable "security_group_name" {}
variable "security_rules" {
  type        = list(object(
    {
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }
  ))
}
variable "virtual_machine_name" {}
variable "vm_size" {}
variable "fend_hostname" {}
variable "fend_username" {}
variable "fend_password" {}
variable "bend_hostname" {}
variable "bend_username" {}
variable "bend_password" {}

variable "database_name" {}
variable "primary_database_admin" {}
variable "primary_database_password" {}

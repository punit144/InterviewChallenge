provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "resourcegroup" {
  source = "./modules/resourcegroup"
  
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "networking" {
  source  = "./modules/networking"
  
  resource_group_name = module.resourcegroup.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_cidr           = var.vnet_cidr
  subnet_names        = var.subnet_names
  subnet_cidrs        = var.subnet_cidrs
}

module "securitygroup" {
  source  = "./modules/securitygroup"
  
  resource_group_name = module.resourcegroup.resource_group_name
  security_group_name = var.security_group_name
  security_rules      = var.security_rules
  location            = var.location
}

module "database" {
  source = "./modules/database"
  
  resource_group_name = module.resourcegroup.resource_group_name
  location            = var.location
  database_name       = var.database_name
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
}

module "compute" {
  source = "./modules/compute"
  
  resource_group_name = module.resourcegroup.resource_group_name
  location            = var.location
  virtual_machine_name = var.virtual_machine_name
  vm_size             = var.vm_size
  subnet_id           = module.networking.subnet_id
  security_group_id   = module.securitygroup.security_group_id
  fend_hostname = var.fend_hostname
  fend_username = var.fend_username
  fend_password = var.fend_password
  bend_hostname = var.bend_hostname
  bend_username = var.bend_username
  bend_password = var.bend_password
}

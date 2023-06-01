# Compute resources frontend
resource "azurerm_network_interface" "fnic" {
  name                = "${var.fend_hostname}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.fend_hostname}-nic-config"
    subnet_id                     = var.subnet_id[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.fvm_public_ip.id
  }
}

resource "azurerm_public_ip" "fvm_public_ip" {
  name                = "${var.fend_hostname}-publicip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_machine" "fapp" {
  name                  = "${var.fend_hostname}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.fnic.id]
  vm_size               = var.vm_size
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "fapp-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.fend_hostname
    admin_username = var.fend_username
    admin_password = var.fend_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Compute resources backend
resource "azurerm_network_interface" "bnic" {
  name                = "${var.bend_hostname}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.bend_hostname}-nic-config"
    subnet_id                     = var.subnet_id[1]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "bapp" {
  name                  = "${var.bend_hostname}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.bnic.id]
  vm_size               = var.vm_size
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "bapp-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.bend_hostname
    admin_username = var.bend_username
    admin_password = var.bend_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
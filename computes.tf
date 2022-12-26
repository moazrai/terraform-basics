resource "azurerm_linux_virtual_machine" "vm" {
  name                = "tutorial-vm"
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name
  size                = "Standard_D2ads_v5"
  admin_username      = var.vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = tls_private_key.vm_ssh_pk.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "tutorial-vm"
  disable_password_authentication = true
}

# RSA key of size 4096 bits
resource "tls_private_key" "vm_ssh_pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

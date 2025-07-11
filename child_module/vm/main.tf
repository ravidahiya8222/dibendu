resource "azurerm_public_ip" "pip" {
    
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
    
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name


  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.data.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
    
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = "adminuser"
  admin_password = "user@123"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic.id,]


  

  os_disk { 
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   ="latest"
  }
  custom_data = base64encode(<<-EOT
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
EOT
)  
}







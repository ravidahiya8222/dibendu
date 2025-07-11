data "azurerm_subnet" "data" {
   
    name = var.subnet_data
    virtual_network_name = var.vnet
    resource_group_name = var.resource_group_name
}
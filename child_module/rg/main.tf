resource "azurerm_resource_group" "rg" {
    for_each = var.rg_child
    name = each.value.name
    location =each.value.location
}
resource "azurerm_resource_group" "rg2q" {
    for_each = var.rg_child
    name = each.value.name
    location =each.value.location
}
resource "azurerm_resource_group" "rg2q" {
    for_each = var.rg_child
    name = each.value.name
    location =each.value.location
}
mere nam dibendu h pkka

 

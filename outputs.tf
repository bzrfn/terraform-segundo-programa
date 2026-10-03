output "resource_group_name" {
  description = "Nombre del grupo de recursos creado."
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "Identificador completo del grupo de recursos."
  value       = azurerm_resource_group.rg.id
}

output "virtual_network_name" {
  description = "Nombre de la red virtual creada."
  value       = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
  description = "Identificador completo de la red virtual."
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_address_space" {
  description = "Espacios de direcciones configurados en la red virtual."
  value       = azurerm_virtual_network.vnet.address_space
}

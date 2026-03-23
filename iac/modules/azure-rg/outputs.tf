output "rg_name" {
  value = azurerm_resource_group.rg.name # Exporta o nome para outros módulos
}

output "rg_location" {
  value = azurerm_resource_group.rg.location # Exporta a localização
}
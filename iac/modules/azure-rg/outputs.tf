output "rg_name" {
  value = azurerm_resource_group.this.name # Exporta o nome para outros módulos
}

output "rg_location" {
  value = azurerm_resource_group.this.location # Exporta a localização
}
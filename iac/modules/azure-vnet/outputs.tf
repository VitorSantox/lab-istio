output "vnet_id" {
  value = azurerm_virtual_network.vnet.id # ID da rede para peering ou monitoramento
}

output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id # O AKS precisará deste ID para se injetar na rede
}
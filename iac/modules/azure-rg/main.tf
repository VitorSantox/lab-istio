#definição do resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name  #define o nome do agrupador logico
  location = var.location #degfine a regiao fisica onde os recursos serao criados
}
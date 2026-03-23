#herda as config do arquivo principal
include "root" {
  path = find_in_parent_folders()
}

#aponta para o modulo criado
terraform {
  source = "../../../modules/azure-vnet"
}

#define as dependencias
dependency "rg" {
  config_path = "../rg"
}

inputs = {
  #herança de dados, pega o nome do rg
  resource_group_name = dependency.rg.outputs.rg_name
  location            = dependency.rg.outputs.rg_location

  vnet_name       = "vnet-istio-lab"
  address_space   = ["10.0.0.0/16"]
  subnet_name     = "snet-aks-istio"
  subnet_prefixes = ["10.0.1.0/24"]
}

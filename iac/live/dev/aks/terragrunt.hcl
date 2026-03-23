#herda as config do arquivo principal
include "root" {
  path = find_in_parent_folders()
}

#aponta para o modulo criado
terraform {
  source = "../../../modules/azure-aks"
}

#define as dependencias
dependency "rg" {
  config_path = "../rg"
}
dependency "vnet" {
  config_path = "../vnet"
}

inputs = {
  #herança dos modulos
  resource_group_name = dependency.rg.outputs.rg_name
  location            = dependency.rg.outputs.rg_location
  vnet_subnet_id      = dependency.vnet.outputs.subnet_id

  # CONFIGURAÇÃO ESPECÍFICA DESTE CLUSTER
  cluster_name = "aks-istio-lab-01"
  node_count   = 1              # Foco em custo baixo
  vm_size      = "Standard_B2s" # Foco em custo baixo
}
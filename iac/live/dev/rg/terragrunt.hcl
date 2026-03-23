#herda as config do arquivo principal
include "root" {
  path = find_in_parent_folders()
}

#aponta para o modulo criado
terraform {
  source = "../../../modules/azure-rg"
}

#passa as variaveis
inputs = {
  rg_name  = "rg-istio-lab-dev"
  location = "eastus"
}
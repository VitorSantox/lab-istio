#O bloco locals lê o arquivo YAML na raiz
locals {
  # find_in_parent_folders busca o arquivo common_vars.yaml subindo as pastas
  common = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

# Configuração do Remote State  (ststetesterraform)
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    #rg existente para o tfstate
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "ststetesterraform"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"

    # Como o RG já existe, garantimos que o Terragrunt apenas use, sem tentar criar
    #skip_resource_group_creation = true

  }
}

# Geração do provider padrão
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}

#Injeção de variáveis globais para TODOS os módulos filhos
# Isso evita que você tenha que declarar o RG em cada terragrunt.hcl local
inputs = {
  resource_group_name = local.common.resource_group_name
  location            = local.common.location
}
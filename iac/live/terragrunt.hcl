# Configuração do Backend Remoto (Azure Blob Storage)
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
# Geração do provider padrão para todos os módulos filhos
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}
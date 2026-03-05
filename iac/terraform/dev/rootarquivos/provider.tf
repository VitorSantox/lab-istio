terraform {                      # Bloco Terraform
  required_version = ">= 1.10.0" # Versão mínima do Terraform

  required_providers {              # Providers usados
    azurerm = {                     # Provider 
      source  = "hashicorp/azurerm" # Origem oficial
      version = "~>4.1.0"           # Faixa de versão estável
    }
  }
}

provider "azurerm" { # Configura o provider 
  features {}
}

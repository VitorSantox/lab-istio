#definição do cluster AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "dns-aks01"

  sku_tier = "Free" # Gratuito, mas sem suporte.

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    #pontos de herança
    #vincula os nós do cluster diretamente na subnet que foi criada no modulo vnet
    vnet_subnet_id = var.vnet_subnet_id #herdado do modulo da vnet
  }

  identity {
    type = "SystemAssigned"
  }

  #config de rede para suporte ao istio
  network_profile {
    network_plugin    = "azure"    # Azure CNI: Cada pod ganha um IP da VNET (melhor para o Istio)
    load_balancer_sku = "standard" # Obrigatório para produção/istio
    network_policy    = "azure"    # Segurança de rede nativa
  }

  tags = {
    Environment = "Lab"
  }
}


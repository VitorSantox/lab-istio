output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name # Exporta o nome do cluster
}

output "host" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.host # Endpoint da API do K8s
  sensitive = true                                              # Informação sensível (não aparece no log comum)
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw # Arquivo de configuração bruto
  sensitive = true
}
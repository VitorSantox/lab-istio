#herdados
variable "resource_group_name" {
  type = string # Receberá o output do módulo de RG
}

variable "location" {
  type = string #vem do rg
}

variable "vnet_subnet_id" {
  type = string # Receberá o output do módulo de VNet
}

#do recurso do AKS
variable "cluster_name" {
  type        = string
  description = "nome do cluster na azure"
}

variable "node_count" {
  type        = number
  default     = 1
  description = "número de nós do cluster"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "tamanho da máquina virtual para os nós do cluster"
}   
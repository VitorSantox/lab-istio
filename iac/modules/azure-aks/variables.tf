variable "resource_group_name" {
  type = string # Receberá o output do módulo de RG
}

variable "cluster_name" {
  type        = string
  description = "nome do cluster na azure"
}
variable "resource_group_name" {
  type = string # Receberá o output do módulo de RG
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"] # Faixa de IP da rede virtual
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"] # Faixa de IP específica para os nós do AKS
}

variable "subnet_id" {
  type = string # Receberá o ID da subnet para ser usado no módulo do AKS

}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "resource_group_name" {
  type    = string
  default = "nonprod"
}

variable "storage_account_name" {
  type    = string
  default = "nonprodstorageterraform"
}

variable "container_name" {
  type    = string
  default = "nonprodcontainerterraform"
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "azurerm_virtual_network" {
  type    = string
  default = "nonprod-ballast-vnet"
}

variable "azurerm_virtual_network_address" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "azurerm_subnet_name" {
  type    = string
  default = "nonprod-ballast-subnet"
}

variable "azurerm_subnet_address" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "azurerm_container_registry_id" {
  type    = string
  default = "/subscriptions/6eb45b59-3ead-4817-9b4b-5201ac067738/resourceGroups/nonprod/providers/Microsoft.ContainerRegistry/registries/ballastacr"
}

variable "azurerm_container_registry_name" {
  type    = string
  default = "nonprodballastacr"
}

variable "azurerm_kubernetes_cluster_name" {
  type    = string
  default = "nonprod-ballast-aks"
}

variable "azurerm_kubernetes_cluster_dnsprefix" {
  type    = string
  default = "ballastaks"
}

variable "azurerm_kubernetes_cluster_version" {
  type    = string
  default = "1.29.2"
}

variable "azurerm_kubernetes_cluster_vm_size" {
  type    = string
  default = "Standard_D2_v2"
}

variable "azurerm_kubernetes_cluster_svcaccount" {
  type    = string
  default = "sa-ballast"
}

variable "azurerm_kubernetes_cluster_namespace" {
  type    = string
  default = "ballast"
}
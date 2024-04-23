# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.azurerm_kubernetes_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.azurerm_kubernetes_cluster_dnsprefix

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = var.azurerm_kubernetes_cluster_vm_size
    os_disk_size_gb = 30
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = "10.0.2.0/24"
    dns_service_ip     = "10.0.2.10"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = "standard"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


  tags = {
    env       = "nonprod",
    createdBy = "terraform"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "master" {
  name                  = "master"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.azurerm_kubernetes_cluster_vm_size
  node_count            = 1
  orchestrator_version  = var.azurerm_kubernetes_cluster_version
  os_disk_size_gb       = 30
  mode                  = "System"

  tags = {
    env       = "nonprod",
    createdBy = "terraform"
  }

  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "azurerm_kubernetes_cluster_node_pool" "workers" {
  name                  = "workers"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.azurerm_kubernetes_cluster_vm_size
  node_count            = 1
  # enable_auto_scaling  = true
  # min_count            = 1
  # max_count            = 5
  orchestrator_version = var.azurerm_kubernetes_cluster_version
  os_disk_size_gb      = 30
  mode                 = "User"

  tags = {
    env       = "nonprod",
    createdBy = "terraform"
  }

  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "azurerm_role_assignment" "ara" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
  depends_on                       = [azurerm_subnet.subnet, azurerm_container_registry.acr, azurerm_kubernetes_cluster.aks]
}

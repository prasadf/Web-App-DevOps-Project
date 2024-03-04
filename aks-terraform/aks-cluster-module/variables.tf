
# Define input variables for AKS cluster customisation

variable "aks_cluster_name" {
  description = "The name of the AKS cluster to be created"
  type        = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix of the cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to be used by the cluster"
  type        = string
}

variable "service_principal_client_id" {
  description = "The Client ID for the service principal associated with the cluster"
  type        = string
}

variable "service_principal_secret" {
  description = "The Client Secret for the service principal associated with the cluster"
  type        = string
}

# Include output variables from the networking module as input variables for this module

variable "resource_group_name" {
  description = "The name of the resource group where networking resources are located"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network where the AKS cluster will be deployed"
  type        = string
}

variable "control_plane_subnet_id" {
  description = "The ID of the subnet for the AKS control plane"
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the subnet for the AKS worker nodes"
  type        = string
}

output "aks_nsg_id" {
  description = "The ID of the Network Security Group (NSG)."
  value       = azurerm_network_security_group.aks_nsg.id
}
# outputs.tf

output "vnet_id" {
  description = "The ID of the VNet created for the AKS cluster."
  value       = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the control plane subnet within the VNet."
  value       = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
  description = "The ID of the worker node subnet within the VNet."
  value       = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources were provisioned in."
  value       = azurerm_resource_group.aks.name
}

output "aks_nsg_id" {
  description = "The ID of the Network Security Group (NSG)."
  value       = azurerm_network_security_group.aks_nsg.id
}

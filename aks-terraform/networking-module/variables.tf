# Variable for resource group
variable "resource_group_name" {
  description = "The name of the Asure resource group"
  type        = string
  default     = "myResourceGroup" 
}

# Variable for location
variable "location" {
  description = "The Azure region/location where the resource group will be hosted"
  type        = string
  default    = "UK South"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network (VNet) that will be created."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_ip_address" {
  description = "The address space for the Public IP Address."
  type        = string
  
}




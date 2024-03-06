variable "client_id" {
  description = "Access key for the provider"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Secret key for the provider"
  type        = string
  sensitive   = true
}

variable "public_ip_address" {
  description = "The address space for the Public IP Address."
  type        = string
  
}

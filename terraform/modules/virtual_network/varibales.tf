variable "location" {
  type        = string
  description = "Azure Region to use"
}
variable "resource_group_name" {
  type        = string
  description = "Name of Azure Resource Group"
}
variable "name" {
  type        = string
  description = "Name of Vnet"
}
variable "dns_servers" {
  type        = list(string)
  description = "list of DNS Servers"
  default     = null
}
variable "vnet_cidrs" {
  type        = list(string)
  description = "Vnet CIDR"
}
variable "subnets" {
  type        = list(object({
    name           = string
    address_prefix = string
    security_group = string
  }))

  description = "Subnet list with CIDR and NSG assignment"
}
variable "tags" {
  type        = map(any)
  description = "Tags"
  default     = {}
}

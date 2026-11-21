variable "QA_vnet" {
  type = map(object({
    vnet_name = string
    vnet_address_space = list(string) 
    vnet_location = string
    vnet_resource_group_name = string
    subnet = map(object({
      subnet_name = string
      address_prefixes = list(string)
    }))
  }))
}
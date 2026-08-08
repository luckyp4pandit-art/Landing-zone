variable "QA_public_ip" {
  type = map(object({
    public_ip_name = string
    public_ip_location = string
    public_ip_resource_group_name = string
    public_ip_allocation_method = string
  }))
}
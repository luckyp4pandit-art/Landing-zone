variable "QA_compute_association" {
  type = map(object({
    QA_association_subnet_name = string
    QA_association_vnet_name = string
    QA_association_resource_group_name = string
    QA_nsg_name = string
  }))
}
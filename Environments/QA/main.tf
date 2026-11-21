module "rg" {
  source = "../../Resources/1.Resource_Group"
  QA_rg  = var.QA_rg
}
module "networking" {
  depends_on = [module.rg]
  source     = "../../Resources/2.Networking"
  QA_vnet    = var.QA_vnet
}
module "public_ip" {
  depends_on   = [module.rg]
  source       = "../../Resources/3.Public_IP"
  QA_public_ip = var.QA_public_ip
}
module "bastion_host" {
  depends_on      = [module.rg, module.networking, module.public_ip]
  source          = "../../Resources/5.Bastion"
  QA_bastion_host = var.QA_bastion_host
}
module "compute" {
  depends_on = [module.bastion_host, module.networking, module.public_ip, module.rg]
  source     = "../../Resources/4.Compute"
  QA_nic     = var.QA_nic
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../Resources/6.NSG"
  QA_nsg     = var.QA_nsg
}
module "compute_association" {
  depends_on             = [module.rg, module.networking, module.nsg]
  source                 = "../../Resources/7.Compute_nsg_assocaition"
  QA_compute_association = var.QA_compute_association
}
module "mssql_server" {
  depends_on      = [module.rg]
  source          = "../../Resources/8.Data_server"
  QA_mssql_server = var.QA_mssql_server
}
module "msql_db" {
  depends_on        = [module.rg, module.mssql_server]
  source            = "../../Resources/9.Databse"
  QA_mssql_database = var.QA_mssql_database
}
module "lb" {
  depends_on = [module.rg, module.compute, module.networking]
  source     = "../../Resources/10.Load_balancer"
  QA_lb      = var.QA_lb
}
module "backendpoolvm" {
  depends_on            = [module.rg, module.compute, module.lb]
  source                = "../../Resources/11.Backend_pool_vm_association"
  QA_bp_nic_association = var.QA_bp_nic_association
}
module "app_gateway" {
  depends_on     = [module.rg, module.networking, module.public_ip, module.compute, ]
  source         = "../../Resources/12.Application_Gateway"
  QA_app_gateway = var.QA_app_gateway
}
module "app_gateway_backendpool_vm_association" {
  depends_on                    = [module.rg, module.compute, module.app_gateway]
  source                        = "../../Resources/13.Application_backendpool_vm_association"
  QA_app_gateway_vm_association = var.QA_app_gateway_vm_association
}
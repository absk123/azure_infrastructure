


module "RG" {
  source = "git::https://github.com/absk123/azure_module.git//resource_group/azure_resource_group?ref=main"
  rg     = var.rg
}

module "SA" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//storage_account/azure_storage_account?ref=main"
  sa     = var.sa
  gg     = module.RG.Resource_Group
}

module "VNET" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//virtual_network/azure_virtual_network?ref=main"
  nets   = var.nets
  rg     = module.RG.Resource_Group
}

module "WEB" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//app_service/azure_app_service?ref=main"
  web    = var.web
  rg     = module.RG.Resource_Group
}

module "AKS" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//aks_cluster/azure_aks_cluster?ref=main"
  aks    = var.aks
  rg     = module.RG.Resource_Group
}

module "DB" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//data_base/azure_data_base?ref=main"
  db     = var.db
  rg     = module.RG.Resource_Group
}

module "PIP" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//public_ip/azure_public_ip?ref=main"
  pip    = var.pip
  rg     = module.RG.Resource_Group
}

module "AGW" {
  source = "git::ssh://git@github.com/absk123/azure_module.git//app_gateway/azure_app_gateway?ref=main"
  agw    = var.agw
  rg     = module.RG.Resource_Group
  sbnet  = module.VNET.Sub_Network
  pip    = module.PIP.Public_IP
}
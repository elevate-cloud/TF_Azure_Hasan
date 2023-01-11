// RG Modules
module "rg_az104_06_rg1" {
  source   = "./modules/resource_group"
  rg_name = var.rg1_name
  location = var.location
}
module "rg_az104_06_rg4" {
  source   = "./modules/resource_group"
  rg_name = var.rg4_name
  location = var.location
}
module "rg_az104_06_rg5" {
  source   = "./modules/resource_group"
  rg_name = var.rg5_name
  location = var.location
}
// Vnet Modules
module "az104-06-vnet01" {
    source = "./modules/vnet"
    vnet_name = var.vnet01_name
    rg_name = module.rg_az104_06_rg1.name
    location = module.rg_az104_06_rg1.location
    vnet_address_space = var.vnet01_address_space
    vnet_tags = var.vnet01_tags  
}
module "az104-06-vnet2" {
   source = "./modules/vnet"
    vnet_name = var.vnet2_name
    rg_name = module.rg_az104_06_rg1.name
    location = module.rg_az104_06_rg1.location
    vnet_address_space = var.vnet2_address_space
    vnet_tags = var.vnet2_tags 
}
module "az104-06-vnet3" {
   source = "./modules/vnet"
    vnet_name = var.vnet3_name
    rg_name = module.rg_az104_06_rg1.name
    location = module.rg_az104_06_rg1.location
    vnet_address_space = var.vnet3_address_space
    vnet_tags = var.vnet3_tags 
}
module "Subnet0_vnet01" {
    source = "./modules/subnet"
    subnet_name = var.subnet0_vnet01_name
    rg_name = module.rg_az104_06_rg1.name
    vnet_name = module.az104-06-vnet01.name
   subnet_address_prefixes = var.subnet0_vnet01_address_prefixes
}
module "Subnet1" {
    source = "./modules/subnet"
    subnet_name = var.subnet1_vnet01_name
    rg_name = module.rg_az104_06_rg1.name
    vnet_name = module.az104-06-vnet01.name
   subnet_address_prefixes = var.subnet1_vnet01_address_prefixes
}
module "Subnet-appgw" {
    source = "./modules/subnet"
    subnet_name = var.subnet_appgw_vnet01_name
    rg_name = module.rg_az104_06_rg1.name
    vnet_name = module.az104-06-vnet01.name
   subnet_address_prefixes = var.subnet_appgw_vnet01_address_prefixes
}
module "Subnet0_vnet2" {
    source = "./modules/subnet"
    subnet_name = var.subnet0_vnet2_name
    rg_name = module.rg_az104_06_rg1.name
    vnet_name = module.az104-06-vnet2.name
   subnet_address_prefixes = var.subnet0_vnet2_address_prefixes
}
module "Subnet0_vnet3" {
    source = "./modules/subnet"
    subnet_name = var.subnet0_vnet3_name
    rg_name = module.rg_az104_06_rg1.name
    vnet_name = module.az104-06-vnet3.name
   subnet_address_prefixes = var.subnet0_vnet3_address_prefixes
}
module "nic_vm0" {
  source = "./modules/nic"
    nic_name = var.nic_vm0_name
    location = var.location
    rg_name = module.rg_az104_06_rg1.name
    nic_ip_config_name = var.nic_vm0_ip_config_name
    subnet_id = module.Subnet0_vnet01.id
    nic_private_ip_address_allocation = var.nic_vm0_private_ip_address_allocation
}
module "nic_vm1" {
  source = "./modules/nic"
    nic_name = var.nic_vm1_name
    location = var.location
    rg_name = module.rg_az104_06_rg1.name
    nic_ip_config_name = var.nic_vm1_ip_config_name
    subnet_id = module.Subnet1.id
    nic_private_ip_address_allocation = var.nic_vm1_private_ip_address_allocation
}
module "nic_vm2" {
  source = "./modules/nic"
    nic_name = var.nic_vm2_name
    location = var.location
    rg_name = module.rg_az104_06_rg1.name
    nic_ip_config_name = var.nic_vm2_ip_config_name
    subnet_id = module.Subnet0_vnet2.id
    nic_private_ip_address_allocation = var.nic_vm2_private_ip_address_allocation
}
module "nic_vm3" {
  source = "./modules/nic"
    nic_name = var.nic_vm3_name
    location = var.location
    rg_name = module.rg_az104_06_rg1.name
    nic_ip_config_name = var.nic_vm3_ip_config_name
    subnet_id = module.Subnet0_vnet3.id
    nic_private_ip_address_allocation = var.nic_vm3_private_ip_address_allocation
}
module "vm0" {
  source = "./modules/virtual_machine"
  vm_name = var.vm0_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vm_size = var.vm0_size
  admin_usename = var.vm0_admin_username
  admin_password = var.vm0_password
  nic_ids = module.nic_vm0.nic_id
  vm_caching = var.vm0_caching
  os_disk_type = var.vm0_os_disk_type
  image_publisher = var.vm0_image_publisher
  image_offer = var.vm0_image_offer
  image_sku = var.vm0_image_sku
}
module "vm1" {
  source = "./modules/virtual_machine"
  vm_name = var.vm1_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vm_size = var.vm0_size
  admin_usename = var.vm0_admin_username
  admin_password = var.vm0_password
  nic_ids = module.nic_vm1.nic_id
  vm_caching = var.vm0_caching
  os_disk_type = var.vm0_os_disk_type
  image_publisher = var.vm0_image_publisher
  image_offer = var.vm0_image_offer
  image_sku = var.vm0_image_sku
}
module "vm2" {
  source = "./modules/virtual_machine"
  vm_name = var.vm2_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vm_size = var.vm0_size
  admin_usename = var.vm0_admin_username
  admin_password = var.vm0_password
  nic_ids = module.nic_vm2.nic_id
  vm_caching = var.vm0_caching
  os_disk_type = var.vm0_os_disk_type
  image_publisher = var.vm0_image_publisher
  image_offer = var.vm0_image_offer
  image_sku = var.vm0_image_sku
}
module "vm3" {
  source = "./modules/virtual_machine"
  vm_name = var.vm3_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vm_size = var.vm0_size
  admin_usename = var.vm0_admin_username
  admin_password = var.vm0_password
  nic_ids = module.nic_vm3.nic_id
  vm_caching = var.vm0_caching
  os_disk_type = var.vm0_os_disk_type
  image_publisher = var.vm0_image_publisher
  image_offer = var.vm0_image_offer
  image_sku = var.vm0_image_sku
}
module "vnet_peering_1_to_2" {
  source = "./modules/vnet_peering"
  vnet_peering_name = var.vnet01_to_vnet2_peering_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vnet_name = var.vnet01_name
  remote_virtual_network_id = module.az104-06-vnet2.id
  
}
module "vnet_peering_2_to_1" {
  source = "./modules/vnet_peering"
  vnet_peering_name = var.vnet2_to_vnet01_peering_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vnet_name = var.vnet2_name
  remote_virtual_network_id = module.az104-06-vnet01.id
  
}
module "vnet_peering_1_to_3" {
  source = "./modules/vnet_peering"
  vnet_peering_name = var.vnet01_to_vnet3_peering_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vnet_name = var.vnet01_name
  remote_virtual_network_id = module.az104-06-vnet3.id
  
}
module "vnet_peering_3_to_1" {
  source = "./modules/vnet_peering"
  vnet_peering_name = var.vnet3_to_vnet01_peering_name
  rg_name = module.rg_az104_06_rg1.name
  location = var.location
  vnet_name = var.vnet3_name
  remote_virtual_network_id = module.az104-06-vnet01.id
  
}

// Route Table
module "rt23" {
  source = "./modules/route_table"
  route_table_name = var.rt23_name
  location = var.location
  rg_name = module.rg_az104_06_rg1.name
  route_name = var.rt23_route_name
  route_address_prefix = var.subnet0_vnet2_address_prefixes
  route_next_hop_type = var.rt23_next_hop_type
  }
  module "rt32" {
  source = "./modules/route_table"
  route_table_name = var.rt32_name
  location = var.location
  rg_name = module.rg_az104_06_rg1.name
  route_name = var.rt32_route_name
  route_address_prefix = var.subnet0_vnet3_address_prefixes
  route_next_hop_type = var.rt32_next_hop_type
  }

// Public Ip
module "az104-06-pip4" {
  source = "./modules/public_ip"
  public_ip_name =var.pip4_name
  rg_name = var.rg4_name
  location = var.location
  pip_allocation_method = var.pip4_allocation_method
}
module "az104-06-pip5" {
  source = "./modules/public_ip"
  public_ip_name =var.pip5_name
  rg_name = var.rg5_name
  location = var.location
  pip_allocation_method = var.pip5_allocation_method
}

// Load Balancer
module "az104-06-lb4" {
  source = "./modules/load_balancer"
  load_balancer_name =var.lb4_name
  location =var.location
  rg_name = var.rg4_name
  load_balancer_pip_name = module.az104-06-pip4.name
  load_balancer_public_ip_address_id =module.az104-06-pip4.pip_id
}

# // Application Gateway
# module "az104-06-appgw5" {
#   source = "./modules/application_gateway"
#   app_gw_name =var.app_gw_name
#   rg_name = var.rg5_name
#   location = var.location
#   sku_name = var.sku_name
#   sku_tier = var.sku_tier
#   sku_capacity = var.sku_capacity
#   app_gw_ip_config_name = var.app_gw_ip_config_name
#   app_gw_ip_config_subnet_id = module.Subnet-appgw.id
#   frontend_port_name = var.frontend_port_name
#   frontend_port = var.frontend_port
#   frontend_ip_configuration_name = var.frontend_ip_configuration_name
#   public_ip_address_id =module.az104-06-pip5.pip_id
#   backend_address_pool_name = var.backend_address_pool_name
#   backend_http_settings_name = var.backend_http_settings_name
#   cookie_based_affinity = var.cookie_based_affinity
#   backend_http_settings_port = var.backend_http_settings_port
#   backend_http_settings_protocol = var.backend_http_settings_protocol
#   backend_http_settings_request_timeout = var.backend_http_settings_request_timeout
#   http_listener_name =var.http_listener_name
#   http_listener_frontend_ip_configuration_name = var.http_listener_frontend_ip_configuration_name
#   http_listener_frontend_port_name = var.http_listener_frontend_port_name
#   http_listener_protocol = var.http_listener_protocol
#   request_routing_rule_name = var.request_routing_rule_name
#   request_routing_rule_type = var.request_routing_rule_type
#   request_routing_rule_http_listener_name = var.request_routing_rule_http_listener_name
#   request_routing_rule_backend_address_pool_name = var.request_routing_rule_backend_address_pool_name
#   request_routing_rule_backend_http_settings_name = var.request_routing_rule_backend_http_settings_name

  
# }
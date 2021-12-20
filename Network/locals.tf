locals {
    hub_subnet_prefixes = [for s in var.hub_subnets : s.address_space]
    hub_subnet_names = [for s in var.hub_subnets : s.name]
    //spoke_vnets = [for v in var.spoke_vnets : v]
}
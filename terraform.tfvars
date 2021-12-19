resource_group_name = "Test-TF-01"
location = "eastus2"
vnet_name = "VNet-Spoke-Dev-EastUS2-01"
vnet_cidr_range = "10.1.0.0/16"
subnet_prefixes = ["10.1.0.0/24", "10.1.1.0/24"]
subnet_names = ["web", "database"]
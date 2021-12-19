resource_group_name = "Test-TF-02"
location = "eastus2"
vnet_name = "VNet-Spoke-Dev-EastUS2-02"
vnet_cidr_range = "10.2.0.0/16"
subnet_prefixes = ["10.2.0.0/24", "10.2.1.0/24"]
subnet_names = ["Web-10.2.0.0_24", "Data-10.2.1.0_24"]
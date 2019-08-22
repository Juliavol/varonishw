#################################################################
#   Variables
#################################################################

# Provider info
subscription_id = "XXXXX"

git  = "XXXXX"

client_secret = "XXXXX"

tenant_id = "XXXXX"

# Generic info
location = "West Europe"

resource_group_name = "productname"

environment_name = "varonisDC"

# Network
address_space = "10.100.0.0/16"

dns_servers = ["10.100.1.4", "10.100.1.5"]

dcsubnet_name = "sndc"

dcsubnet_prefix = "10.100.1.0/24"

wafsubnet_name = "snwf"

wafsubnet_prefix = "10.100.10.0/24"

rpsubnet_name = "snrp"

rpsubnet_prefix = "10.100.20.0/24"

issubnet_name = "snis"

issubnet_prefix = "10.100.30.0/24"

dbsubnet_name = "sndb"

dbsubnet_prefix = "10.100.50.0/24"

# Active Directory & Domain Controller 1

prefix = "varonisDC"

private_ip_address = "10.100.1.4"

dc2private_ip_address = "10.100.1.5"

admin_username = "AdminTest"

admin_password = "Password123"

# IIS Servers

vmcount = "1"

domainadmin_username   = "AdminTest@varonisDC.local"



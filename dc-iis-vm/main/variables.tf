#################################################################
#   Variables
#################################################################

# Provider info

# Generic info

# Network
variable address_space {}

variable dns_servers {
  type = "list"
}

variable wafsubnet_name {}
variable wafsubnet_prefix {}
variable rpsubnet_name {}
variable rpsubnet_prefix {}
variable issubnet_name {}
variable issubnet_prefix {}
variable dbsubnet_name {}
variable dbsubnet_prefix {}
variable dcsubnet_name {}
variable dcsubnet_prefix {}

# Active Directory & Domain Controller

# IIS Servers
variable vmcount {}

# Domain Controller 2
variable "dc2private_ip_address" {}
variable "domainadmin_username" {}

# SQL LB
//variable "lbprivate_ip_address" {}
//# SQL DB Servers
//variable sqlvmcount {}




# Provider info
variable subscription_id {
  type    = "string"
  default = "5f48cac6-f566-4002-845e-eaa7e170a33d"
}

variable client_id {
  type    = "string"
  default = "fb15f249-135a-4445-98ca-9f3d1d5dcb93"
}
variable client_secret {
  type    = "string"
  default = "varonistest12345"
}
variable tenant_id {
  type    = "string"
  default = "d17cc384-c780-40b0-8e71-6bb95de90962"
}

# Generic info
variable location {
  type    = "string"
  default = "useast"
}
variable resource_group_name {
  type    = "string"
  default = ""
}
variable environment_name {
  type    = "string"
  default = "varonisDC"
}


# Active Directory & Domain Controller
variable prefix {
  type    = "string"
  default = ""
}
variable private_ip_address {
    type    = "string"
  default = "10.0.1.4"
}
variable admin_username {
  type    = "string"
  default = "AdminTest"
}
variable admin_password {
  type    = "string"
  default = "Password123"
}

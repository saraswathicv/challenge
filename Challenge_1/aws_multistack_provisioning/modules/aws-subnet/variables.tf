variable "vpc_id" {
    type = string
}
variable "create_public_subnet" {
    type = bool
}
variable "public_subnets_cidr" {
    type = list(string)
    default = []
}
variable "public_subnets_azs" {
    type = list(string)
    default = []
}
variable "map_public_ip_on_launch" {
    type = bool
    default = false
}
variable "public_subnet_assign_ipv6_address_on_creation" {
    type = bool
    default = null
}
variable "assign_ipv6_address_on_creation" {
    type = bool
    default = false
}
variable "public_subnets_names" {
    type = list(string)
    default = []
}
variable "tags" {
    type = map(string)
    default = {}
}
variable "public_subnets_tags" {
    type = map(string)
    default = {}
}
variable "create_private_subnet" {
    type = bool
}
variable "private_subnets_cidr" {
    type = list(string)
    default = []
}
variable "private_subnets_azs" {
    type = list(string)
    default = []
}
variable "private_subnet_assign_ipv6_address_on_creation" {
    type = bool
    default = null
}
variable "private_subnets_names" {
    type = list(string)
    default = []
}
variable "private_subnets_tags" {
    type = map(string)
    default = {}
}

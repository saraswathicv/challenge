variable "number_of_instances" {
  type = number
}
variable "ec2_names" {
    type = list(string)
}
variable "ec2_ami_ids" {
  type = list(string)
}
variable "instance_type" {
  type = list(string)
}
variable "ec2_key_names" {
  type = list(string)
}
variable "ec2_subnet_ids" {
  type = list(string)
}
variable "ec2_security_group_ids" {
  type = list(string)
}
variable "monitoring" {
  type = bool
  default = false
}
variable "get_password_data" {
  type = bool 
  default = false
}
variable "associate_public_ip_address" {
  type = bool
  default = false
}
variable "ec2_private_ips" {
  type = list(string) 
  default = [""]
}
variable "ec2_secondary_private_ips" {
   type = list(string)
   default = [""]
}
variable "ec2_ipv6_addresses" {
   type = list(string)
   default = [""]
}
variable "ebs_optimized" {
   type = bool
   default = false
}
variable "tags" {
  type = map(string)
}

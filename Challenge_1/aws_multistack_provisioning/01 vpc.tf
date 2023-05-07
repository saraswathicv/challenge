module "aws-vpc" {
  source               = "./modules/aws-vpc"
  cidr                 = var.vpc_cidr
  vpc_name             = var.vpc_name
  vpc_tags             = var.vpc_tags
  tags                 = var.tags
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_ipv6          = var.enable_ipv6
  create_vpc           = var.create_vpc
}
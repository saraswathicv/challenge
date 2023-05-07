module "aws-public-subnet" {
  source                                        = "./modules/aws-subnet"
  count                                         = length(var.public_subnets_cidr) > 0 ? 1 : 0
  create_public_subnet                          = var.create_public_subnet
  create_private_subnet                         = false
  vpc_id                                        = module.aws-vpc.vpc_id
  public_subnets_names                          = var.public_subnets_names
  public_subnets_cidr                           = var.public_subnets_cidr
  public_subnets_azs                            = var.public_subnets_azs
  map_public_ip_on_launch                       = var.map_public_ip_on_launch
  public_subnet_assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
  public_subnets_tags                           = var.public_subnets_tags
  assign_ipv6_address_on_creation               = var.assign_ipv6_address_on_creation
  tags                                          = var.tags
  #    private_subnets_names = var.private_subnets_names
  #    private_subnets_cidr = var.private_subnets_cidr
  #    private_subnets_azs = var.private_subnets_azs
  #    private_subnet_assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation
  #    private_subnets_tags = var.private_subnets_tags
  depends_on = [
    module.aws-vpc,
  ]
}

module "aws-private-subnet" {
  source                = "./modules/aws-subnet"
  count                 = length(var.private_subnets_cidr) > 0 ? 1 : 0
  create_private_subnet = var.create_private_subnet
  create_public_subnet  = false
  vpc_id                = module.aws-vpc.vpc_id
  #    public_subnets_names = var.public_subnets_names
  #    public_subnets_cidr = var.public_subnets_cidr
  #    public_subnets_azs = var.public_subnets_azs
  #    map_public_ip_on_launch = var.map_public_ip_on_launch
  #    public_subnet_assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
  #    public_subnets_tags = var.public_subnets_tags
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  tags                                           = var.tags
  private_subnets_names                          = var.private_subnets_names
  private_subnets_cidr                           = var.private_subnets_cidr
  private_subnets_azs                            = var.private_subnets_azs
  private_subnet_assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation
  private_subnets_tags                           = var.private_subnets_tags
  depends_on = [
    module.aws-vpc,
  ]
}
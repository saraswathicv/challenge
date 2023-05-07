module "aws-rt" {
  source             = "./modules/aws-rt"
  count              = var.create_rt ? 1 : 0
  rt_name            = var.rt_name
  create_route_table = var.create_rt
  vpc_id             = module.aws-vpc.vpc_id
  tags               = var.tags
  cidr_block         = var.rt_cidr_block
  route_table_routes = [{
    gateway_id = module.aws-igw[0].igw_id
  }]
  subnets = concat(module.aws-public-subnet[0].public_subnets_ids)
}
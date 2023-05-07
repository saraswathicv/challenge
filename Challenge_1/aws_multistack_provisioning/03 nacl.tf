module "aws-nacl" {
  source             = "./modules/aws-nacl"
  vpc_id             = module.aws-vpc.vpc_id
  create_nacl        = var.create_nacl
  subnets_cidr       = module.aws-public-subnet[0].public_subnets_ids
  nacl_names         = var.nacl_names
  inbound_acl_rules  = var.inbound_acl_rules
  outbound_acl_rules = var.outbound_acl_rules
  tags               = var.tags
  depends_on = [
    module.aws-public-subnet,
  ]
}
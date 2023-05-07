module "aws-sg" {
  source                 = "./modules/aws-sg"
  vpc_id                 = module.aws-vpc.vpc_id
  security_group_name    = var.security_group_name
  security_group_ingress = var.security_group_ingress
  security_group_egress  = var.security_group_egress
  tags                   = var.tags
}
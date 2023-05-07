module "aws-igw" {
  source = "./modules/aws-igw"
  count  = var.create_igw ? 1 : 0
  vpc_id = module.aws-vpc.vpc_id
  tags   = var.tags
}
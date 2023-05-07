module "aws-rds" {
  source                = "./modules/aws-rds"
  count                 = var.create_rds ? 1 : 0
  subnet_group_name     = var.rds_subnet_group_name
  subnet_ids            = module.aws-private-subnet[0].private_subnets_ids
  tags                  = var.tags
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage
  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  db_name               = var.rds_db_name
  username              = var.rds_username
  password              = var.rds_password
  parameter_group_name  = var.rds_parameter_group_name
}

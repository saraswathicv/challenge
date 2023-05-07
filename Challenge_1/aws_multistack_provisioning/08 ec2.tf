module "aws-ec2-webserver" {
  source                      = "./modules/aws-ec2"
  number_of_instances         = 1
  ec2_names                   = var.webserver_instance_name
  ec2_ami_ids                 = var.webserver_instance_ami
  instance_type               = var.webserver_instance_type
  ec2_key_names               = module.aws-key.private_key[*]
  ec2_subnet_ids              = module.aws-public-subnet[0].public_subnets_ids
  ec2_security_group_ids      = module.aws-sg.vpc_security_group_id[*]
  monitoring                  = var.webserver_ec2_monitoring
  get_password_data           = var.webserver_get_password_data
  associate_public_ip_address = var.webserver_associate_public_ip
  tags                        = var.tags
}

module "aws-ec2-appserver" {
  source                      = "./modules/aws-ec2"
  number_of_instances         = 1
  ec2_names                   = var.appserver_instance_name
  ec2_ami_ids                 = var.appserver_instance_ami
  instance_type               = var.appserver_instance_type
  ec2_key_names               = module.aws-key.private_key[*]
  ec2_subnet_ids              = module.aws-private-subnet[0].private_subnets_ids
  ec2_security_group_ids      = module.aws-sg.vpc_security_group_id[*]
  monitoring                  = var.appserver_ec2_monitoring
  get_password_data           = var.appserver_get_password_data
  associate_public_ip_address = var.appserver_associate_public_ip
  tags                        = var.tags
}


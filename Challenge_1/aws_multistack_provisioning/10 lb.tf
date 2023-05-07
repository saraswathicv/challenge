

#Load Balancer for Webserver
module "internet-facing-alb" {
  source                   = "./modules/aws-alb"
  count                    = var.create_internet_facing_alb ? 1 : 0
  name                     = var.web_alb_name
  load_balancer_type       = var.web_alb_type
  vpc_id                   = module.aws-vpc.vpc_id
  subnets                  = module.aws-public-subnet[0].public_subnets_ids
  security_groups          = module.aws-sg.vpc_security_group_id[*]
  target_groups            = var.web_alb_target_groups
  target_group_attachments = var.web_alb_target_groups_attachment
  listeners                = var.web_alb_listeners
  taget_id                 = local.webserver_id
  tags                     = var.tags
}



####For Application Server
# Load Balancer for application server
module "internal-facing-alb" {
  source                   = "./modules/aws-alb"
  count                    = var.create_internal_facing_alb ? 1 : 0
  name                     = var.app_alb_name
  internal                 = true
  load_balancer_type       = var.app_alb_type
  vpc_id                   = module.aws-vpc.vpc_id
  subnets                  = module.aws-private-subnet[0].private_subnets_ids
  security_groups          = module.aws-sg.vpc_security_group_id[*]
  target_groups            = var.app_alb_target_groups
  target_group_attachments = var.app_alb_target_groups_attachment
  listeners                = var.app_alb_listeners
  tags                     = var.tags
  taget_id                 = local.appserver_id
}

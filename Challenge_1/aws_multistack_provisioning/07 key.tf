module "aws-key" {
  source = "./modules/aws-key"
  #  createprivkey = false
  passpublickey = var.passpublickey
  key_name      = var.key_name
  tags          = var.tags
}

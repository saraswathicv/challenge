locals {
  # rhelami = "ami-052639b6127cfb32d"
  webserver_id = module.aws-ec2-webserver.ec2_id
  appserver_id = module.aws-ec2-appserver.ec2_id
}


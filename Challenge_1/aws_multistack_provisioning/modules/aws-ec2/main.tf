#--- Creation of EC2 Instance with the key pair ---
resource "aws_instance" "instance" {
  count = var.number_of_instances
  ami = element(var.ec2_ami_ids, count.index)
  instance_type = element(var.instance_type, count.index)
  key_name             = element(var.ec2_key_names, count.index)
  subnet_id              = element(var.ec2_subnet_ids, count.index)
  vpc_security_group_ids = var.ec2_security_group_ids[*]
  monitoring           = var.monitoring
  get_password_data    = var.get_password_data  #For Windows VM
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = var.ebs_optimized
  tags        = merge({ "Name" = element(var.ec2_names, count.index) }, var.tags)
  volume_tags = merge({ "Name" = element(var.ec2_names, count.index) }, var.tags)
}

resource "aws_db_subnet_group" "private" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags =  var.tags
}

resource "aws_db_instance" "private" {
  allocated_storage    = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  db_subnet_group_name = aws_db_subnet_group.private.name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
}

resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0

  name        = var.name
  name_prefix = var.name_prefix

  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_groups
  subnets            = var.subnets

  tags = merge(
    var.tags,
    var.lb_tags,
    {
      Name = var.name != null ? var.name : var.name_prefix
    },
  )

  
}

resource "aws_lb_target_group" "main" {
  count = var.create_lb ? length(var.target_groups) : 0

  name        = lookup(var.target_groups[count.index], "name", null)
  name_prefix = lookup(var.target_groups[count.index], "name_prefix", null)

  vpc_id           = var.vpc_id
  port             = lookup(var.target_groups[count.index], "backend_port", null)
  protocol         = lookup(var.target_groups[count.index], "backend_protocol", null) 
  protocol_version = lookup(var.target_groups[count.index], "protocol_version", null) 
  target_type      = lookup(var.target_groups[count.index], "target_type", null)
  tags = merge(
    var.tags,
    var.target_group_tags,
   )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "this" {
  count  = length(var.target_group_attachments )
  target_group_arn  =  aws_lb_target_group.main[count.index].arn
  target_id         = var.taget_id
  port              = lookup(var.target_group_attachments[count.index], "port", null)
  availability_zone = lookup(var.target_group_attachments[count.index], "availability_zone", null)
}


resource "aws_lb_listener" "elb" {

  count  = length( var.listeners )
  load_balancer_arn = aws_lb.this[count.index].arn
  port              = lookup(var.listeners[count.index], "port", null)
  protocol          = lookup(var.listeners[count.index], "protocol", null)

  default_action {
    type             = lookup(var.listeners[count.index], "type", null)
    target_group_arn = aws_lb_target_group.main[count.index].arn
  }
}
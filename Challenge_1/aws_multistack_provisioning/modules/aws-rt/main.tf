resource "aws_route_table" "rt" {
  count = var.create_route_table ? 1 : 0

  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route_table_routes
    content {
      # One of the following destinations must be provided
      cidr_block      = var.cidr_block
      ipv6_cidr_block = lookup(route.value, "ipv6_cidr_block", null)

      # One of the following targets must be provided
      egress_only_gateway_id    = lookup(route.value, "egress_only_gateway_id", null)
      gateway_id                = lookup(route.value, "gateway_id", null)
      instance_id               = lookup(route.value, "instance_id", null)
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_endpoint_id           = lookup(route.value, "vpc_endpoint_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }

  timeouts {
    create = "5m"
    update = "5m"
  }

  tags = merge(
    { "Name" = var.rt_name },
    var.tags,
  )
}

resource "aws_route_table_association" "association" {
  count = length(var.subnets) > 0 ? length(var.subnets) : 0
  subnet_id      = var.subnets[count.index]
  route_table_id = aws_route_table.rt[0].id
}
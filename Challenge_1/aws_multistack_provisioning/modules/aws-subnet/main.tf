resource "aws_subnet" "public" {
  count = var.create_public_subnet == true ? length(var.public_subnets_cidr) : 0

  vpc_id                          = var.vpc_id
  cidr_block                      = element(var.public_subnets_cidr, count.index)
  availability_zone               = length(regexall("^[a-z]{2}-", element(var.public_subnets_azs, count.index))) > 0 ? element(var.public_subnets_azs, count.index) : null
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation == null ? var.assign_ipv6_address_on_creation : var.public_subnet_assign_ipv6_address_on_creation

  tags = merge(
    {
      "Name" = element(var.public_subnets_names, count.index) 
    },
    var.tags,
    var.public_subnets_tags,
  )
}






################################################################################
# Private subnet
################################################################################

resource "aws_subnet" "private" {
  count = var.create_private_subnet == true ? length(var.private_subnets_cidr) : 0
  vpc_id                          = var.vpc_id
  cidr_block                      = var.private_subnets_cidr[count.index]
  availability_zone               = length(regexall("^[a-z]{2}-", element(var.private_subnets_azs, count.index))) > 0 ? element(var.private_subnets_azs, count.index) : null
  assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation == null ? var.assign_ipv6_address_on_creation : var.private_subnet_assign_ipv6_address_on_creation

  tags = merge(
    {
      "Name" = element(var.private_subnets_names, count.index) 
    },
    var.tags,
    var.private_subnets_tags,
  )
}

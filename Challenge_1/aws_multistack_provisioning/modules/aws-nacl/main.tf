#Testing to pass subnet ids through data
#data "aws_subnet" "subnet_ids" {
#  for_each = toset(var.subnets_cidr)
#  cidr_block = each.value
#}
################################################################################
# Network ACLs
################################################################################

resource "aws_network_acl" "nacl" {
  count = var.create_nacl == true ? 1 : 0
  vpc_id     = var.vpc_id
  #subnet_ids = data.aws_subnet.subnet_ids[*].ids
  subnet_ids = var.subnets_cidr[*]

  tags = merge(
    { 
      "Name" = element(var.nacl_names, count.index)
    },
    var.tags,
  )
}

resource "aws_network_acl_rule" "inbound" {
  count = var.create_nacl == true ? length(var.inbound_acl_rules) : 0

  network_acl_id = aws_network_acl.nacl[0].id
  egress          = false
  rule_number     = var.inbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.inbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.inbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.inbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.inbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.inbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.inbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.inbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.inbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

resource "aws_network_acl_rule" "outbound" {
  count = var.create_nacl == true ? length(var.outbound_acl_rules) : 0
  network_acl_id = aws_network_acl.nacl[0].id

  egress          = true
  rule_number     = var.outbound_acl_rules[count.index]["rule_number"]
  rule_action     = var.outbound_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.outbound_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.outbound_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.outbound_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.outbound_acl_rules[count.index], "icmp_type", null)
  protocol        = var.outbound_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.outbound_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.outbound_acl_rules[count.index], "ipv6_cidr_block", null)
}

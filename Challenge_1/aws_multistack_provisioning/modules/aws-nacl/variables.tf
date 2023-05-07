variable "create_nacl" {
 type = bool
 default = false
}
variable "vpc_id"{
 type = string
}
variable "subnets_cidr" {
 type = list(string)
 default = []
}
variable "nacl_names" {
 type = list(string)
 default = []
}
variable "tags" {
    type = map(string)
}
variable "inbound_acl_rules" { 
  type = list(map(string))
  default = [ 
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
    ]

}
variable "outbound_acl_rules" {
    type = list(map(string))
    default = [ 
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
    ]
  
}
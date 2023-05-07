variable "vpc_id"{
 type = string
}

variable "tags" {
    type = map(string)
}

variable "security_group_name" {
  description = "Name to be used on the custom security group"
  type        = string
  default     = null
}

variable "security_group_ingress" {
  description = "List of maps of ingress rules to set on the custom security group"
  type        = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
#    ipv6_cidr_blocks = list(string)
  }))
#  default     = []
}
variable "security_group_egress" {
  description = "List of maps of egress rules to set on the custom security group"
  type        = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
#    ipv6_cidr_blocks = list(string)
  }))
#  default     = []
}

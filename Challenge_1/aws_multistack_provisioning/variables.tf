variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "create_vpc" {
  type    = bool
  default = true
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "Terraform-Dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "192.168.0.0/26"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}
variable "vpc_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    Environment = "NonProd"
    IaC         = "Terraform"
    Team        = "Rapidops"
  }
}


variable "create_public_subnet" {
  type    = bool
  default = true
}
variable "public_subnets_cidr" {
  type    = list(string)
  default = ["192.168.0.0/28", "192.168.0.16/28"]
}
variable "public_subnets_azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}
variable "public_subnet_assign_ipv6_address_on_creation" {
  type    = bool
  default = false
}
variable "assign_ipv6_address_on_creation" {
  type    = bool
  default = false
}
variable "public_subnets_names" {
  type    = list(string)
  default = ["public_subnet_dev_1", "public_subnet_dev_2"]
}
variable "public_subnets_tags" {
  type = map(string)
  default = {
    Source = "Terraform"
  }
}
variable "create_private_subnet" {
  type    = bool
  default = true
}
variable "private_subnets_cidr" {
  type    = list(string)
  default = ["192.168.0.32/28", "192.168.0.48/28"]
}
variable "private_subnets_azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "private_subnet_assign_ipv6_address_on_creation" {
  type    = bool
  default = false
}
variable "private_subnets_names" {
  type    = list(string)
  default = ["private_subnet_dev_1", "private_subnet_dev_2"]
}
variable "private_subnets_tags" {
  type = map(string)
  default = {
    Source = "Terraform"
  }
}



#Variables for NACL. Tags and vpc id is different from modules

variable "create_nacl" {
  type    = bool
  default = true
}
variable "nacl_names" {
  type    = list(string)
  default = ["Terra-dev-Public-NACL"]
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
      cidr_block  = "192.168.0.0/26"
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
      cidr_block  = "192.168.0.0/26"
    },
  ]

}



# Security Group
variable "security_group_name" {
  description = "Name to be used on the custom security group"
  type        = string
  default     = "Terra-Dev-SG"
}
variable "security_group_ingress" {
  description = "List of maps of ingress rules to set on the custom security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/26"]
    }, {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/26"]
    },
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["192.168.0.0/26"]
    },
    {
      description = "Database"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["192.168.0.0/26"]
  }]
}
variable "security_group_egress" {
  description = "List of maps of egress rules to set on the custom security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}


#Key

variable "createprivkey" {
  type    = bool
  default = false
}
variable "key_name" {
  type    = string
  default = "Terraform-dev-Key"
}

variable "passpublickey" {
  type    = bool
  default = true
}

variable "public_key" {
  type    = string
  default = "Terraform-dev-Key"
}

#Internet Gateway
variable "create_igw" {
  type    = bool
  default = true
}

#Route Table
variable "create_rt" {
  type    = bool
  default = true
}

variable "route_table_routes" {
  type    = list(map(string))
  default = []
}

variable "rt_name" {
  type    = string
  default = "Terraform-Dev-Route-Table"
}

variable "rt_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}


#Webserver Instance

variable "webserver_instance_name" {
  type    = list(string)
  default = ["Terra-Dev-Webserver"]
}
variable "webserver_instance_ami" {
  type    = list(string)
  default = ["ami-052639b6127cfb32d"]
}
variable "webserver_instance_type" {
  type    = list(string)
  default = ["t3.large"]
}
variable "webserver_ec2_monitoring" {
  type    = bool
  default = false
}
variable "webserver_get_password_data" {
  type    = bool
  default = false
}
variable "webserver_associate_public_ip" {
  type    = bool
  default = false
}





#Appserver Instance

variable "appserver_instance_name" {
  type    = list(string)
  default = ["Terra-Dev-Appserver"]
}
variable "appserver_instance_ami" {
  type    = list(string)
  default = ["ami-052639b6127cfb32d"]
}
variable "appserver_instance_type" {
  type    = list(string)
  default = ["t3.large"]
}
variable "appserver_ec2_monitoring" {
  type    = bool
  default = false
}
variable "appserver_get_password_data" {
  type    = bool
  default = false
}
variable "appserver_associate_public_ip" {
  type    = bool
  default = false
}



#RDS

variable "create_rds" {
  type    = bool
  default = true
}

variable "rds_subnet_group_name" {
  type    = string
  default = "rdsterraform"
}
variable "rds_allocated_storage" {
  type    = number
  default = 10
}

variable "rds_max_allocated_storage" {
  type    = number
  default = 30
}

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_engine_version" {
  type    = string
  default = "5.7"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "rds_db_name" {
  type    = string
  default = "AppDB"
}

variable "rds_username" {
  type    = string
  default = "Rapidops"
}

variable "rds_password" {
  type    = string
  default = "Linux98765"
}

variable "rds_parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}



#LoadBalancer

variable "create_internet_facing_alb" {
  type    = bool
  default = true
}

variable "web_alb_name" {
  type    = string
  default = "web-alb"
}

variable "web_alb_type" {
  type    = string
  default = "application"
}

variable "web_alb_target_groups" {
  type = any
  default = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]
}

variable "web_alb_target_groups_attachment" {
  type = any
  default = [{
    port = 80
  }]
}

variable "web_alb_listeners" {
  type = any
  default = [{
    protocol = "HTTP"
    port     = 80
    type     = "forward"
  }]
}



variable "create_internal_facing_alb" {
  type    = bool
  default = true
}

variable "app_alb_name" {
  type    = string
  default = "app-alb"
}

variable "app_alb_type" {
  type    = string
  default = "application"
}


variable "app_alb_target_groups" {
  type = any
  default = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

}

variable "app_alb_target_groups_attachment" {
  type = any
  default = [{
    port = 80
  }]
}

variable "app_alb_listeners" {
  type = any
  default = [{
    protocol = "HTTP"
    port     = 80
    type     = "forward"
  }]
}






#ALB 


variable "webserver_asg_min_vm" {
  type    = number
  default = 1
}

variable "webserver_asg_max_vm" {
  type    = number
  default = 2
}

variable "webserver_asg_desired_capacity" {
  type    = number
  default = 1
}

variable "webserver_asg_image_id" {
  type    = string
  default = "ami-052639b6127cfb32d"
}

variable "webserver_asg_instance_type" {
  type    = string
  default = "t3.large"
}

variable "appserver_asg_min_vm" {
  type    = number
  default = 1
}

variable "appserver_asg_max_vm" {
  type    = number
  default = 2
}

variable "appserver_asg_desired_capacity" {
  type    = number
  default = 1
}

variable "appserver_asg_image_id" {
  type    = string
  default = "ami-052639b6127cfb32d"
}

variable "appserver_asg_instance_type" {
  type    = string
  default = "t3.large"
}
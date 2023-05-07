variable "subnet_group_name" {
    type = string
}
variable "subnet_ids" {
    type = list(string)
}
variable "tags" {
  type = map(string)
}


variable "allocated_storage" {
  type = number
}   

variable "max_allocated_storage" {
  type = number
} 

variable "engine" {
  type = string
}    

variable "engine_version" {
  type = string
}  

variable "instance_class" {
  type = string
}

variable "db_name" {
  type = string
}              

variable "username"  {
  type = string
}   

variable "password" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

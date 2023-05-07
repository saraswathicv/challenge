variable "create_route_table" {
    type = bool
    default = false
}

variable "vpc_id" {
    type = string
}

variable "route_table_routes" {
    type = list(map(string))
}

variable "rt_name" {
    type = string  
}

variable "cidr_block" {
    type = string  
}

variable "tags" {
    type = map(string) 
}
variable "subnets" {
    type = list(string) 
}
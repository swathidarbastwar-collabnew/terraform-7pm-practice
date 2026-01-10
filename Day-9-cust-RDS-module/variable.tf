

variable "identifier" {
     type = string
     default = ""

}

variable "engine" {
     type = string
     default = ""

}

variable "engine_version" {
     type = string
     default = ""

}

variable "instance_class" {
     type = string
     default = ""

}

variable "allocated_storage" {
     type = string
     default = ""

}

variable "db_name" {
     type = string
     default = ""

}

variable "username" {
     type = string
     default = ""

}

variable "password" {
     type = string
     default = ""

}

variable "port" {
     type = string
     default = ""

}

variable "vpc_security_group_ids" {
     type = string
     default = ""

}

variable "maintenance_window" {
     type = string
     default = ""

}

variable "backup_window" {
     type = string
     default = ""

}

variable "monitoring_interval" {
     type = string
     default = ""

}

variable "db_subnet_group" {
     type = string
     default = ""

}

variable "subnet_ids" {
     type = tuple([ string, string ])

    

}

variable "deletion_protection" {
     type = string
     default = ""

}



variable "cidrblk" {
     type = string
     default = ""

}

variable "cidrblk1" {
     type = string
     default = ""

}

variable "cidrblk2" {
     type = string
     default = ""

}

variable "vpcname" {
     type = string
     default = ""

}

variable "subnet1" {
     type = string
     default = ""

}

variable "subnet2" {
     type = string
     default = ""

}

variable "availzone1" {
     type = string
     default = ""

}

variable "sgname" {
     type = string
     default = ""

}

variable "description1" {
     type = string
     default = ""

}

variable "from_port1" {
     type = number
     

}

variable "to_port1" {
     type = number
     

}

variable "protocol1" {
     type = string
     default = ""

}

variable "cidrblocks1" {
     type = list(string)
     
     

}

variable "description2" {
     type = string
     default = ""

}

variable "from_port2" {
     type = number
     

}

variable "to_port2" {
     type = number
     

}

variable "protocol2" {
     type = string
     default = ""

}

variable "cidrblocks2" {
     type = list(string)
     
     

}

variable "description3" {
     type = string
     default = ""

}

variable "from_port3" {
     type = number
     

}

variable "to_port3" {
     type = number
     

}

variable "protocol3" {
     type = string
     default = ""

}

variable "cidrblocks3" {
     type = list(string)
     
     

}

variable "from_port4" {
     type = number
     

}

variable "to_port4" {
     type = number
     

}

variable "protocol4" {
     type = string
     default = ""

}

variable "cidrblocks4" {
     type = list(string)
     
}
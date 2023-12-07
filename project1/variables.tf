
variable "name" { 
}
variable "region" {
   
}
variable "vpc_cidr_block" {

}
variable "public_subnet_cidr_blocks" {

  type        = map(string)
}
variable "private_subnet_cidr_blocks" {
 
  type        = map(string)
}

variable "availability_zones" {

  type        = list(string)
}
variable "security_group_name" {

}
variable "ingress_ports" {

  type        = list(object({
    port        = number
    description = string
  }))
}

variable "ingress_ports_nexp" {
 
  type        = list(object({
    port        = number
    description = string
  }))
}

variable "egress_ports" {

  type        = list(object({
    port        = number
    description = string
  }))
}
variable "ami_owners" {

}
variable "ami_name" {

}
variable "ami_virtualization-type" {
   
}
variable "instance_type" {
    
}
variable "key_name" {

}
variable "user_data_file_ps" {
 

}
variable "user_data_file_nexp" {
    
  
}
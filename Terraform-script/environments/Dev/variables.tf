variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_cidr" {}
variable "az" {}
variable "sg_name" {}

variable "instances" {
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
  }))
}
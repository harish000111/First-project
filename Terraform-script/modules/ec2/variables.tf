variable "vpc_id" {}
variable "subnet_id" {}
variable "sg_name" {}

variable "instances" {
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
  }))
}
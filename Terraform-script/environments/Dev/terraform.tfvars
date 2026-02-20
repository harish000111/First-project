vpc_cidr           = "10.0.0.0/16"
vpc_name           = "dev-vpc"
public_subnet_cidr = "10.0.1.0/24"
az                 = "ap-south-1a"
sg_name            = "dev-sg"

instances = [
  {
    name          = "Jenkins"
    ami           = "ami-019715e0d74f695be" # Ubuntu 22.04
    instance_type = "t2.medium"
  },
  {
    name          = "Ansible"
    ami           = "ami-051a31ab2f4d498f5" #amazon-linux
    instance_type = "t2.micro"
  },
  {
    name          = "Docker"
    ami           = "ami-019715e0d74f695be" # ubuntu
    instance_type = "t2.micro"
  },
  {
    name          = "EKS"
    ami           = "ami-019715e0d74f695be" #ubuntu
    instance_type = "t2.medium"
  }
]
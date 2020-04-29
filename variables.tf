variable "active_key" {
    default = "user"
}
variable "security_key" {
    default = "password"
}
variable "aws_region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default = "10.0.0.0/28"
}

variable "private_subnet_cidr" {
    default = "10.0.1.0/28"
}

variable "allow_all" {
    default = "0.0.0.0/0"
}
variable "subnet_zone" {
    description = "public availability zone"
    default     = "us-east-1a"
}
variable "image" {
    description = "instance images"
    default     = "ami-0323c3dd2da7fb37d"
}

variable "instance_type" {
    description = "instance type"
    default     = "t2.micro"
}
variable "key" {
    description = "instance key name"
    default     = "drupalzoka"
}

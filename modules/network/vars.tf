variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnet1_cidr" {
  type        = string
  description = "CIDR block for the first private subnet"
}

variable "private_subnet2_cidr" {
  type        = string
  description = "CIDR block for the second private subnet"
}

variable "public_subnet1_cidr" {
  type        = string
  description = "CIDR block for the first public subnet"
}

variable "public_subnet2_cidr" {
  type        = string
  description = "CIDR block for the second public subnet"
}


variable "az1" {
  type        = string
  description = "Availability Zone for the first subnet"
}

variable "az2" {
  type        = string
  description = "Availability Zone for the second subnet"
}
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


variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instances"
}

variable "project_name" {
  type        = string
  description = "Name of the project for tagging resources"
  default     = "demo-web-app"
}

variable "key_name" {
  description = "Key name for the EC2 instances"
  type        = string
}

variable "key_path" {
  type        = string
  description = "Path to the SSH public key file for the EC2 instances"
}


variable "user_data_1" {
  description = "User data script for the first EC2 instance"
  type        = string
}

variable "user_data_2" {
  description = "User data script for the second EC2 instance"
  type        = string
}

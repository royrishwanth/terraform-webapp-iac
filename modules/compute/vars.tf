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


variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EC2 instances"
  type        = list(string)

}

variable "vpc_id" {
  description = "VPC ID where the EC2 instances will be launched"
  type        = string

}

variable "user_data_1" {
  description = "User data script for the EC2 instances"
  type        = string
}

variable "user_data_2" {
  description = "User data script for the second EC2 instance"
  type        = string
  
}
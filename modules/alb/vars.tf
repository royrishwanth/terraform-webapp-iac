variable "public_subnet_ids" {
  description = "List of private subnet IDs for the EC2 instances"
  type        = list(string)

}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string

}

variable "instance_ids" {
  description = "List of EC2 instance IDs to register with the ALB"
  type        = list(string)

}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string

}


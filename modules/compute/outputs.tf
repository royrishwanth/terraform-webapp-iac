output "aws_instance_web_server_1_id" {
  description = "ID of the first web server instance"
  value       = aws_instance.web-server-1.id

}

output "aws_instance_web_server_2_id" {
  description = "ID of the second web server instance"
  value       = aws_instance.web-server-2.id

}

output "key_name" {
  description = "Key name for the EC2 instances"
  value       = aws_key_pair.web-key-pair.key_name

}

output "security_group_id" {
  description = "ID of the security group for the EC2 instances"
  value       = aws_security_group.web-sg.id

}

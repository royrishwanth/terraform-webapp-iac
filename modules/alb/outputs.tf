output "load_balancer_dns_name" {
  description = "Public DNS of the Load Balancer"
  value       = aws_lb.web-lb.dns_name

}
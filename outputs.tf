output "alb_dns_name" {
  description = "Public DNS of the Load Balancer"
  value       = module.alb.load_balancer_dns_name

}
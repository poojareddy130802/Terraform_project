output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.load_balancer.name
}

output "load_balancer_public_ip" {
  description = "The public IP address of the load balancer"
  value       = azurerm_public_ip.load_balancer_ip.ip_address
}
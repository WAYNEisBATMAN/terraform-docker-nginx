output "nginx_local_url" {
  description = "Local access URL"
  value       = "http://localhost:${var.external_port}"
}

output "nginx_external_url" {
  description = "External access URL (replace with actual IP)"
  value       = "http://<your-vm/ec2-public-ip>:${var.external_port}"
}
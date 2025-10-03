output "nginx_access" {
  description = "Ways to access the Nginx container"
  value       = "Local access (from inside VM/EC2): http://localhost:${var.external_port}\nExternal access (from your system): http://<your-vm/ec2-public-ip>:${var.external_port}"
}



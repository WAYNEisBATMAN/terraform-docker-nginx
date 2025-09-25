# Pull the Nginx image
resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = false # Terraform deletes the image from the local Docker host on resource destroy.
}


# Create a Docker container from the Nginx image
resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = var.container_name

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  lifecycle {
    # Forces Terraform to recreate the container if the ports change
    create_before_destroy = false
    ignore_changes        = [] # no ignores, all changes trigger replacement
  }
}

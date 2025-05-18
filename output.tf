output "instance_public_ip" {
  value = aws_instance.docker_server.public_ip
}

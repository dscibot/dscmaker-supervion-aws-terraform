provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "docker_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "docker-server"
  }

  vpc_security_group_ids = [aws_security_group.docker_sg.id]

  user_data = file("init.sh")

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl start docker",
      "sudo usermod -aG docker ec2-user"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

resource "aws_security_group" "docker_sg" {
  name        = "docker-sg"
  description = "Allow SSH, HTTP and HTTPS"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  value = aws_instance.docker_server.public_ip
}

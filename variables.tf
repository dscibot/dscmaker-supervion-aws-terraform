variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID (Amazon Linux 2 recommandé)"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "Type d'instance EC2"
}

variable "key_name" {
  description = "Nom de la key pair AWS"
  type        = string
}

variable "private_key_path" {
  description = "Chemin vers la clé privée (.pem)"
  type        = string
}

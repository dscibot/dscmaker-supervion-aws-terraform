variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "public_key_file" {
  description = "Path to the SSH public key"
  type        = string
  default     = "atouzet.pub"
}

variable "private_key_path" {
  description = "Path to the SSH private key"
  type        = string
  default     = "atouzet"
}

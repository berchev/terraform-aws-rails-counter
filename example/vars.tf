variable "region" {
  description = "AWS default region"
  default     = "us-east-1"
}

variable "ami" {
  description = "AWS ami according to the region"
  default     = "ami-0cfee17793b08a293"
}

variable "instance_type" {
  description = "AWS instance characteristics"
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS ssh key name for that particular region"
  default     = "us-east-1-key-pair"
}

variable "private_key" {
  description = "Full path to your AWS private key"
  default     = "/home/gberchev/Dropbox/ec2_key_pair/us-east-1-key-pair.pem"
}

variable "portainer_port" {
  description = "portainer port value"
  default     = 9000
}

variable "rails_counter" {
  description = "Docker image for rails counter"
  default     = "berchev/counter:0.0.7"
}

variable "redis_image" {
  description = "Specified redis server docker image"
  default     = "redis:4-alpine"
}

variable "redis_password" {
  description = "Pasword which is going to be set on Redis container"
  default     = "georgiman"
}

variable "ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 3000, 6379, 9000]
}

variable "aws_security_group_name" {
  description = "Name of newly created security group for our instance"
  default     = "xenial-security-group"
}

module "rails_counter" {
  source         = "git::https://github.com/berchev/terraform-aws-rails-counter.git"
  region = var.region
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  private_key = var.private_key
  portainer_port = var.portainer_port
  rails_counter = var.rails_counter
  redis_image = var.redis_image
  redis_password = var.redis_password
  ingress_ports = var.ingress_ports
  aws_security_group_name = var.aws_security_group_name
}

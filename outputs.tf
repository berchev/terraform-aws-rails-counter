output "ip_address" {
  value = aws_instance.xenial.public_ip
}

output "server_name" {
  value = aws_instance.xenial.public_dns
}

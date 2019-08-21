output "server_public_ip" {
  value = module.rails_counter.ip_address
}

output "server_name" {
  value = module.rails_counter.server_name
}


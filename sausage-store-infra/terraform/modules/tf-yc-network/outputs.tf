output "network_id" {
  description = "ID of the default network"
  value       = data.yandex_vpc_network.default.id
}

output "subnets" {
  description = "List of created subnets with their IDs"
  value       = { for k, v in yandex_vpc_subnet.subnet : k => v.id }
}

output "subnet_cidrs" {
  description = "List of created subnets with their CIDR blocks"
  value       = { for k, v in yandex_vpc_subnet.subnet : k => v.v4_cidr_blocks }
}

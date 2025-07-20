output "network_id" {
  description = "ID созданной сети"
  value       = yandex_vpc_network.main.id
}

output "subnet_id" {
  description = "ID созданной подсети"
  value       = yandex_vpc_subnet.main.id
}

# Terraform Yandex Cloud Network Module

Этот модуль Terraform создает виртуальную сеть (VPC) и подсети в указанных зонах **Yandex Cloud**.

## Зависимости
- **Terraform >= 1.0.0**
- **Провайдер Yandex Cloud >= 0.87.0**

## Входные переменные
`network_zones` | Список зон для создания подсетей
## Выходные переменные

| Переменная      | Описание                                      |
|----------------|----------------------------------------------|
| `network_id`   | ID созданной сети `default`                 |
| `subnets`      | Список созданных подсетей (ID)               |
| `subnet_cidrs` | CIDR-адреса созданных подсетей              |

## Пример использования

```hcl
module "network" {
  source        = "./modules/tf-yc-network"
  network_zones = ["ru-central1-a", "ru-central1-b"]
}

output "subnet_ids" {
  value = module.network.subnets
}

output "subnet_cidrs" {
  value = module.network.subnet_cidrs
}
```
## Вывод после terraform apply:
```hcl
network_id = "enp1a2b3c4d5e6f"
subnets = {
  "ru-central1-a" = "e2l0abcd1234"
  "ru-central1-b" = "e2l0abcd5678"
}
subnet_cidrs = {
  "ru-central1-a" = ["10.1.0.0/24"]
  "ru-central1-b" = ["10.2.0.0/24"]
}
```
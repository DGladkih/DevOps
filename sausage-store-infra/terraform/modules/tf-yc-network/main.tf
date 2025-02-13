data "yandex_vpc_network" "default" {
  name = "default"
}

resource "yandex_vpc_subnet" "subnet" {
  for_each = toset(var.network_zones)

  name          = "default-${each.key}-14-39"
  zone          = each.value
  network_id    = data.yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.0.${index(var.network_zones, each.key)}.0/24"]
}

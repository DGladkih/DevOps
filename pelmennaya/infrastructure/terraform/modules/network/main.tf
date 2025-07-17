resource "yandex_vpc_network" "main" {
  name      = "pelmen-network"
  folder_id = var.yc_folder_id
}

resource "yandex_vpc_subnet" "main" {
  name           = "pelmen-subnet"
  folder_id      = var.yc_folder_id
  zone           = var.zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

resource "yandex_kubernetes_node_group" "group" {
  cluster_id = yandex_kubernetes_cluster.main.id
  name       = "pelmen-node-group"
  version    = "1.29"

  instance_template {
    platform_id = "standard-v2"

    resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    network_interface {
      subnet_ids = [yandex_vpc_subnet.main.id]
      nat        = true
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

  maintenance_policy {
    auto_repair  = true
    auto_upgrade = true
  }

  labels = {
    env = "prod"
  }
}

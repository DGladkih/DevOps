resource "yandex_kubernetes_node_group" "this" {
  cluster_id = var.cluster_id
  name       = var.node_group_name
  version    = var.k8s_version

  instance_template {
    platform_id = var.platform_id

    resources {
      cores  = var.cores
      memory = var.memory
    }

    boot_disk {
      type = var.disk_type
      size = var.disk_size
    }

    network_interface {
      subnet_ids = var.subnet_ids
      nat        = true
    }
  }

  scale_policy {
    fixed_scale {
      size = var.node_count
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

resource "yandex_kubernetes_cluster" "main" {
  name               = var.cluster_name
  network_id         = var.network_id
  folder_id          = var.folder_id
  cluster_ipv4_range = var.cluster_ipv4_range
  service_ipv4_range = var.service_ipv4_range

  master {
    version = var.k8s_version

    zonal {
      subnet_id = var.subnet_id
      zone      = var.zone
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        start_time = "04:00"
        duration   = "3h"
      }
    }
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  release_channel = "STABLE"

  labels = {
    env = "prod"
  }
}

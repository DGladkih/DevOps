resource "yandex_kubernetes_cluster" "main" {
  name               = "pelmen-cluster"
  network_id         = yandex_vpc_network.main.id
  folder_id          = var.yc_folder_id
  cluster_ipv4_range = var.cluster_ipv4_range
  service_ipv4_range = var.service_ipv4_range

  master {
    version = "1.27"
    zonal {
      subnet_id = yandex_vpc_subnet.main.id
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

  service_account_id      = yandex_iam_service_account.kube.id
  node_service_account_id = yandex_iam_service_account.kube.id

  release_channel = "STABLE"
  labels = {
    env = "prod"
  }

  depends_on = [yandex_iam_service_account.kube]
}

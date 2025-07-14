provider "yandex" {
  service_account_key_file = "./key.json"
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = var.zone
}

#provider "kubernetes" {
#  host                   = yandex_kubernetes_cluster.main.master[0].external_v4_endpoint
#  cluster_ca_certificate = base64decode(yandex_kubernetes_cluster.main.master[0].cluster_ca_certificate)
#  token                  = yandex_iam_token.k8s_token.iam_token
#}

#provider "helm" {
# kubernetes {
#    host                   = yandex_kubernetes_cluster.main.master[0].external_v4_endpoint
#     cluster_ca_certificate = base64decode(yandex_kubernetes_cluster.main.master[0].cluster_ca_certificate)
#    token                  = yandex_iam_token.k8s_token.iam_token
#  }
#}


provider "kubernetes" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

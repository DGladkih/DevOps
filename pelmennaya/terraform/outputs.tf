output "kube_cluster_name" {
  value = yandex_kubernetes_cluster.main.name
}

output "bucket_name" {
  value = yandex_storage_bucket.static_site.bucket
}

output "node_group_name" {
  value = yandex_kubernetes_node_group.group.name
}

output "sa_storage_access_key" {
  value     = yandex_iam_service_account_static_access_key.sa_storage_key.access_key
  sensitive = true
}

output "sa_storage_secret_key" {
  value     = yandex_iam_service_account_static_access_key.sa_storage_key.secret_key
  sensitive = true
}

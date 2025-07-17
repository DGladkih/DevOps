output "cluster_id" {
  description = "ID созданного Kubernetes-кластера"
  value       = yandex_kubernetes_cluster.main.id
}

output "cluster_name" {
  description = "Имя Kubernetes-кластера"
  value       = yandex_kubernetes_cluster.main.name
}

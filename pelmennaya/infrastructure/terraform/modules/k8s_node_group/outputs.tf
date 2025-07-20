output "node_group_id" {
  description = "ID группы узлов"
  value       = yandex_kubernetes_node_group.this.id
}

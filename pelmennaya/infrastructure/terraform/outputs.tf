output "kube_cluster_name" {
  value       = module.k8s_cluster.cluster_name
  description = "Name of the Kubernetes cluster"
}

output "bucket_name" {
  value       = module.object_storage.bucket_name
  description = "Name of the object storage bucket"
}

output "node_group_name" {
  value       = module.k8s_node_group.node_group_id
  description = "Name or ID of the node group"
}
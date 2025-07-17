variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "subnets" {
  type = list(object({
    zone           = string
    v4_cidr_blocks = list(string)
  }))
  description = "Subnets for the network module"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name of the Kubernetes node group"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the node group"
}

variable "bucket_name" {
  type        = string
  description = "Name of the object storage bucket"
}

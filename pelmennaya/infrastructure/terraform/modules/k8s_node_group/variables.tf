variable "cluster_id" {
  type        = string
  description = "ID of the Kubernetes cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs"
}

variable "node_group_name" {
  type        = string
  description = "Name of the node group"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the group"
}

variable "zone" {
  type        = string
  description = "Zone for node group"
}

variable "platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Platform ID for VM instances"
}

variable "cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores per node"
}

variable "memory" {
  type        = number
  default     = 4
  description = "Amount of RAM in GB per node"
}

variable "disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Disk type for node boot disk"
}

variable "disk_size" {
  type        = number
  default     = 64
  description = "Size of the boot disk in GB"
}

variable "k8s_version" {
  type        = string
  default     = "1.29"
  description = "Kubernetes version for the node group"
}

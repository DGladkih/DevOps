variable "yc_cloud_id" {}
variable "yc_folder_id" {}
variable "zone" {}

variable "v4_cidr_blocks" {
  default = ["10.98.11.0/24"]
}

variable "cluster_ipv4_range" {
  default = "10.21.0.0/16"
}

variable "service_ipv4_range" {
  default = "10.22.0.0/16"
}

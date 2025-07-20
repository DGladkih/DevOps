variable "cluster_name" {
  description = "Имя кластера Kubernetes"
  type        = string
}

variable "network_id" {
  description = "ID сети VPC"
  type        = string
}

variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

variable "subnet_id" {
  description = "ID подсети для master-ноды"
  type        = string
}

variable "zone" {
  description = "Зона размещения master-ноды"
  type        = string
}

variable "cluster_ipv4_range" {
  description = "CIDR-подсеть для pod-сети кластера"
  type        = string
}

variable "service_ipv4_range" {
  description = "CIDR-подсеть для service IPs кластера"
  type        = string
}

variable "service_account_id" {
  description = "ID сервисного аккаунта для кластера"
  type        = string
}

variable "k8s_version" {
  description = "Версия Kubernetes"
  type        = string
  default     = "1.29"
}

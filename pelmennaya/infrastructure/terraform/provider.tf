variable "sa_key_file" {
  type        = string
  default     = "./key.json"
  description = "Path to service account key file"
}

variable "kubeconfig_path" {
  type        = string
  default     = "~/.kube/config"
  description = "Path to kubeconfig file"
}

provider "yandex" {
  service_account_key_file = var.sa_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

provider "kubernetes" {}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

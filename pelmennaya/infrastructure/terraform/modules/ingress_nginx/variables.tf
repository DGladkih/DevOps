variable "release_name" {
  type        = string
  default     = "ingress-nginx"
  description = "Name of the Helm release"
}

variable "namespace" {
  type        = string
  default     = "ingress-nginx"
  description = "Namespace to install ingress controller into"
}

variable "repository" {
  type        = string
  default     = "https://kubernetes.github.io/ingress-nginx"
  description = "Helm repository URL"
}

variable "chart" {
  type        = string
  default     = "ingress-nginx"
  description = "Helm chart name"
}

variable "chart_version" {
  type        = string
  default     = "4.10.0"
  description = "Helm chart version"
}

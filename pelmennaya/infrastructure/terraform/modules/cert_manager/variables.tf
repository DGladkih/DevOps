variable "release_name" {
  type        = string
  default     = "cert-manager"
  description = "Name of the Helm release"
}

variable "namespace" {
  type        = string
  default     = "cert-manager"
  description = "Namespace to install cert-manager into"
}

variable "repository" {
  type        = string
  default     = "https://charts.jetstack.io"
  description = "Helm repository URL"
}

variable "chart" {
  type        = string
  default     = "cert-manager"
  description = "Helm chart name"
}

variable "chart_version" {
  type        = string
  default     = "v1.14.2"
  description = "Version of the Helm chart"
}

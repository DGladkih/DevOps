variable "network_zones" {
  description = "VPC subnets"
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}
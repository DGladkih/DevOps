variable "zone" {
  description = "Zone for the instance"
  type        = string
  default     = "ru-central1-a"
}

variable "platform_id" {
  description = "Platform for the instance"
  type        = string
  default     = "standard-v3"
}

variable "cores" {
  description = "Number of cores for the instance"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory for the instance"
  type        = number
  default     = 4
}

variable "image_id" {
  description = "The image ID for the boot disk"
  type        = string
}

variable "disk_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 10
}

variable "subnet_id" {
  description = "The ID of the subnet in Yandex Cloud"
  type        = string
}

variable "preemptible" {
  description = "Instance is preemptible"
  type        = bool
  default     = false
}

variable "iam_token" {  
  description = "iam_token"
  type        = string
}

variable "yc_cloud_id" {  
  description = "The ID in Yandex Cloud"
  type        = string
}

variable "yc_folder_id" {
  description = "The ID folder in Yandex Cloud"
  type        = string
}
variable "bucket_name" {
  type        = string
  description = "Имя object storage bucket"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}

variable "access_key" {
  type        = string
  description = "Access key for object storage"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Secret key for object storage"
  sensitive   = true
}

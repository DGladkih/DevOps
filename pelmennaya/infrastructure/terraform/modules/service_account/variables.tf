variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

variable "sa_name" {
  description = "Имя сервисного аккаунта"
  type        = string
}

variable "roles" {
  description = "Список IAM-ролей для назначения сервисному аккаунту"
  type        = list(string)
}

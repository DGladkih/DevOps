variable "network_name" {
  description = "Имя сети VPC"
  type        = string
}

variable "yc_folder_id" {
  description = "ID папки Yandex Cloud"
  type        = string
}

variable "zone" {
  description = "Зона размещения подсети"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR-блоки IPv4 для подсети"
  type        = list(string)
}

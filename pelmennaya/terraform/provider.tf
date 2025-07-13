provider "yandex" {
  service_account_key_file = "./key.json"
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = var.zone
}

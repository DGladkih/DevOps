resource "yandex_storage_bucket" "static_site" {
  bucket     = "pelmen-static-files"
  folder_id  = var.yc_folder_id

  access_key = var.sa_storage_access_key
  secret_key = var.sa_storage_secret_key

  anonymous_access_flags {
    read = true
  }
}
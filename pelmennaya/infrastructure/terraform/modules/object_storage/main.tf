resource "yandex_storage_bucket" "this" {
  bucket    = var.bucket_name
  folder_id = var.folder_id

  access_key = var.access_key
  secret_key = var.secret_key

  anonymous_access_flags {
    read = true
  }
}

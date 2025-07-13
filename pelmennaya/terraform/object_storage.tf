resource "yandex_iam_service_account" "sa_storage" {
  name        = "storage-sa"
  description = "Service account for object storage"
  folder_id   = var.yc_folder_id
}

resource "yandex_iam_service_account_static_access_key" "sa_storage_key" {
  service_account_id = yandex_iam_service_account.sa_storage.id
  description        = "Static access key for S3"
}

resource "yandex_resourcemanager_folder_iam_member" "sa_storage_role" {
  folder_id = var.yc_folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa_storage.id}"
}

resource "yandex_storage_bucket" "static_site" {
  bucket     = "pelmen-static-files"
  folder_id  = var.yc_folder_id
  access_key = yandex_iam_service_account_static_access_key.sa_storage_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_storage_key.secret_key

  anonymous_access_flags {
    read = true
  }
}

resource "yandex_iam_service_account" "kube" {
  name        = var.sa_name
  description = "Service account for Kubernetes"
  folder_id   = var.folder_id
}

resource "yandex_iam_service_account_iam_binding" "kube_roles" {
  for_each = toset(var.roles)

  service_account_id = yandex_iam_service_account.kube.id
  role               = each.value
  members            = ["serviceAccount:${yandex_iam_service_account.kube.id}"]
}

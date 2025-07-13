resource "yandex_iam_service_account" "kube" {
  name        = "kube-sa"
  description = "Service account for Kubernetes"
  folder_id   = var.yc_folder_id
}

resource "yandex_iam_service_account_iam_binding" "kube-editor" {
  service_account_id = yandex_inanoam_service_account.kube.id
  role               = "editor"
  members            = ["serviceAccount:${yandex_iam_service_account.kube.id}"]
}

resource "yandex_iam_service_account_iam_binding" "kube-agent" {
  service_account_id = yandex_iam_service_account.kube.id
  role               = "k8s.clusters.agent"
  members            = ["serviceAccount:${yandex_iam_service_account.kube.id}"]
}

output "sa_id" {
  description = "ID созданного сервисного аккаунта"
  value       = yandex_iam_service_account.kube.id
}

output "sa_name" {
  description = "Имя созданного сервисного аккаунта"
  value       = yandex_iam_service_account.kube.name
}

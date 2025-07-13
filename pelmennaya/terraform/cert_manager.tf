resource "null_resource" "cert_manager" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.2/cert-manager.yaml
    EOT
  }
  depends_on = [yandex_kubernetes_node_group.group]
}

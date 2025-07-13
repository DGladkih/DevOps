resource "null_resource" "nginx_ingress" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/cloud/deploy.yaml
    EOT
  }
  depends_on = [yandex_kubernetes_node_group.group]
}

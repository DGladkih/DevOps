resource "helm_release" "this" {
  name             = var.release_name
  namespace        = var.namespace
  repository       = var.repository
  chart            = var.chart
  version          = var.chart_version
  create_namespace = true
}

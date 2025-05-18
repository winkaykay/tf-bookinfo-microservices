resource "kubernetes_namespace" "bookinfo" {
  metadata {
    name = var.namespace_name
  }
}

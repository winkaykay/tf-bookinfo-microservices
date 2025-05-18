output "namespace_name" {
  value = kubernetes_namespace.bookinfo.metadata[0].name
}

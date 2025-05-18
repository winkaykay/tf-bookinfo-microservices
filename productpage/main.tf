resource "kubernetes_service_account" "productpage_sa" {
  metadata {
    name      = var.service_account_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      account = var.container_name
    }
  }
}

resource "kubernetes_service" "productpage_service" {
  metadata {
    name      = var.service_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app     = var.container_name
      service = var.container_name
    }
  }
  spec {
    selector = {
      app = var.container_name
    }
    port {
      port = var.port
      name = "http"
    }
  }
}

resource "kubernetes_deployment" "productpage_v1" {
  metadata {
    name      = var.deployment_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app     = var.container_name
      version = "v1"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app     = var.container_name
        version = "v1"
      }
    }
    template {
      metadata {
        labels = {
          app     = var.container_name
          version = "v1"
        }
        annotations = {
          "prometheus.io/scrape" = "true"
          "prometheus.io/port"   = tostring(var.port)
          "prometheus.io/path"   = "/metrics"
        }
      }
      spec {
        service_account_name = var.service_account_name
        container {
          name  = var.container_name
          image = var.image
          port {
            container_port = var.port
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
      }
    }
  }
}

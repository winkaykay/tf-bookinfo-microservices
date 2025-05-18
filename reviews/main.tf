
resource "kubernetes_service_account" "reviews_sa" {
  metadata {
    name      = var.service_account_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      account = var.container_name
    }
  }
}

resource "kubernetes_service" "reviews_service" {
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

resource "kubernetes_deployment" "reviews_v1" {
  metadata {
    name      = var.deployment_name_v1
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

      }
      spec {
        service_account_name = var.service_account_name
        container {
          name  = var.container_name
          image = var.image_name_v1
          port {
            container_port = var.port
          }
          env {
            name  = "LOG_DIR"
            value = "/tmp/logs"
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
          volume_mount {
            name       = "wlp-output"
            mount_path = "/opt/ibm/wlp/output"
          }
        }
        volume {
          name = "wlp-output"
          empty_dir {}
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
      }
    }
  }
}


 
resource "kubernetes_deployment" "reviews_v2" {
  metadata {
    name      = var.deployment_name_v2
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app     = var.container_name
      version = "v2"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app     = var.container_name
        version = "v2"
      }
    }
    template {
      metadata {
        labels = {
          app     = var.container_name
          version = "v2"
        }

      }
      spec {
        service_account_name = var.service_account_name
        container {
          name  = var.container_name
          image = var.image_name_v2
          port {
            container_port = var.port
          }
          env {
            name  = "LOG_DIR"
            value = "/tmp/logs"
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
          volume_mount {
            name       = "wlp-output"
            mount_path = "/opt/ibm/wlp/output"
          }
        }
        volume {
          name = "wlp-output"
          empty_dir {}
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
      }
    }
  }
}


resource "kubernetes_deployment" "reviews_v3" {
  metadata {
    name      = var.deployment_name_v3
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app     = var.container_name
      version = "v3"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app     = var.container_name
        version = "v3"
      }
    }
    template {
      metadata {
        labels = {
          app     = var.container_name
          version = "v3"
        }

      }
      spec {
        service_account_name = var.service_account_name
        container {
          name  = var.container_name
          image = var.image_name_v3
          port {
            container_port = var.port
          }
          env {
            name  = "LOG_DIR"
            value = "/tmp/logs"
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
          volume_mount {
            name       = "wlp-output"
            mount_path = "/opt/ibm/wlp/output"
          }
        }
        volume {
          name = "wlp-output"
          empty_dir {}
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
      }
    }
  }
}

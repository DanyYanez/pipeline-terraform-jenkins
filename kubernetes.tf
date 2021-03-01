provider "kubernetes" {
#  config_context = "minikube"
  config_path = "~/.kube/config"
}

locals {
  Jenkins_labels = {
    App  = "Jenkins"
  }
}

resource "kubernetes_deployment" "Jenkins" {
  metadata {
    name   = "Jenkins"
    labels = local.Jenkins_labels
  }
  spec {
    replicas = 1
    selector {
      match_labels = local.Jenkins_labels
    }
    template {
      metadata {
        labels = local.Jenkins_labels
      }
      spec {
        container {
          image = "jenkins/jenkins"
          name  = "Jenkins"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "Jenkins-service" {
  metadata {
    name = "Jenkins-service"
  }
  spec {
    selector = local.Jenkins_labels
    port {
      port        = 5000
      target_port = 5000
      node_port   = 32000
    }
    type = "NodePort"
  }
}

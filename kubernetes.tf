provider "kubernetes" {
#  config_context = "minikube"
  config_path = "~/.kube/config"
}

locals {
  jenkins_labels = {
    App  = "Jenkins"
  }
}

resource "kubernetes_deployment" "jenkins" {
  metadata {
    name   = "jenkins"
    labels = local.jenkins_labels
  }
  spec {
    replicas = 1
    selector {
      match_labels = local.jenkins_labels
    }
    template {
      metadata {
        labels = local.jenkins_labels
      }
      spec {
        container {
          image = "jenkins/jenkins"
          name  = "jenkins"
          port {
            container_port = 9090
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
  }
  spec {
    selector = local.jenkins_labels
    port {
      port        = 9090
      target_port = 9090
      node_port   = 30205
    }
    type = "NodePort"
  }
}

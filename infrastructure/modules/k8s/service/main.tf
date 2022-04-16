resource "kubernetes_service" "python_webserver_service" {
  metadata {
    name = "python-webserver-service"
  }
  spec {
    selector = {
      run = var.python_webserver_deployment_labels_run
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 4545
    }

    type = "LoadBalancer"
  }
}
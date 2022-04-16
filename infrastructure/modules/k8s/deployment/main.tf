locals {
  python-webserver-name = "python-webserver"
}

resource "kubernetes_deployment" "python-webserver" {
  metadata {
    name   = local.python-webserver-name
    labels = {
      run = local.python-webserver-name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        run = local.python-webserver-name
      }
    }

    template {
      metadata {
        labels = {
          run = local.python-webserver-name
        }
      }

      spec {
        container {
          image = var.python_webserver_image
          name  = local.python-webserver-name
          port {
            name           = "containerport"
            container_port = 4545
          }

          liveness_probe {
            http_get {
              path = "/api/health"
              port = 4545
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
        image_pull_secrets {
          name = "regcred"
        }
      }
    }
  }
}

resource "kubernetes_secret" "regcred" {
  metadata {
    name = var.registry_server
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}
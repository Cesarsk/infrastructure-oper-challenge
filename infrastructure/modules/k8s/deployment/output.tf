output "kubernetes_deployment_python_webserver_metadata_name" {
  value = kubernetes_deployment.python-webserver.metadata[0].name
}
module "s3" {
  source = "./modules/s3"

  oper_staging_bucket  = var.oper_staging_bucket
  oper_terraform_state = var.oper_staging_bucket

  tags = var.tags
}

module "k8s_deployment" {
  source = "./modules/k8s/deployment"

  python_webserver_image = var.python_webserver_image

  registry_password = var.registry_password
  registry_server   = var.registry_server
  registry_username = var.registry_username
}

module "k8s_service" {
  source = "./modules/k8s/service"

  python_webserver_deployment_labels_run = module.k8s_deployment.kubernetes_deployment_python_webserver_metadata_name
}
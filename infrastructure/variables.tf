variable "tags" {
  type = map(string)
}

variable "oper_staging_bucket" {
  type = string
}

variable "oper_terraform_state" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "python_webserver_image" {
  type = string
}

variable "registry_server" {
  type      = string
  sensitive = true
}
variable "registry_username" {
  type      = string
  sensitive = true
}
variable "registry_password" {
  type      = string
  sensitive = true
}
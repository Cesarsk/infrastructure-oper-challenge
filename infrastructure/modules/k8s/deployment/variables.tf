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
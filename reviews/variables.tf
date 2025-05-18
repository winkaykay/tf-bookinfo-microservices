variable "service_account_name" {
  type        = string
  description = "Service account name"
}

variable "service_name" {
  type        = string
  description = "Kubernetes service name"
}



variable "container_name" {
  type        = string
  description = "Container name"
}

variable "image_name_v1" {
  type        = string
  description = "Docker image"
}

variable "image_name_v2" {
  type        = string
  description = "Docker image"
}

variable "image_name_v3" {
  type        = string
  description = "Docker image"
}

variable "deployment_name_v1" {
  type        = string
  description = "Deployment name"
}

variable "deployment_name_v2" {
  type        = string
  description = "Deployment name for reviews v2"
}

variable "deployment_name_v3" {
  type        = string
  description = "Deployment name for reviews v3"
}

variable "port" {
  type        = number
  description = "Port number for the service and container"
  default     = 9080
}
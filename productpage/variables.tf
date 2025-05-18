variable "service_account_name" {
  type        = string
  description = "Service account name"
}

variable "service_name" {
  type        = string
  description = "Kubernetes service name"
}

variable "deployment_name" {
  type        = string
  description = "Deployment name"
}

variable "container_name" {
  type        = string
  description = "Container name"
}

variable "image" {
  type        = string
  description = "Docker image"
}

variable "port" {
  type        = number
  description = "Port number for the service and container"
  default     = 9080
}
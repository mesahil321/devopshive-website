variable "aws_region" {
  default = "us-east-1"
}

variable "ecr_repository" {
  default = "devopshive-website"
}

variable "ecs_cluster_name" {
  default = "devopshive-cluster"
}

variable "ecs_service_name" {
  default = "devopshive-service"
}

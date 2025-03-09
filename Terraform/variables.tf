variable "aws_region" {
  description = "AWS region for EKS cluster"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "Project-k8s-cluster"
}

variable "node_group_name" {
  description = "Name for the managed node group"
  default     = "eks-node-group"
}

variable "node_instance_type" {
  description = "Instance type for worker nodes"
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  default     = 3
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "cluster_service_ipv4_cidr" {
  type    = string
  default = "172.20.0.0/16"
}

variable "cluster_service_cidr" {
  type    = string
  default = "" # Optional: Set a default to avoid errors
}


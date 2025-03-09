variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for worker nodes"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "capacity_type" {
  description = "Type of instances (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "desired_size" {
  description = "number of instances desired"
  type = number
  default = 3
}

 #variable "cluster_service_ipv4_cidr" {
 # type = string
  #default = "172.20.0.0/16"
 


#variable "cluster_service_cidr" {
 # type = string


variable "cluster_service_cidr" {
  type    = string
  default = ""  # Allows fallback to ipv4 CIDR
}

#variable "cluster_service_ipv4_cidr" {
 # type    = string
 # default = "172.20.0.0/16"  # Default to AWS EKS default range



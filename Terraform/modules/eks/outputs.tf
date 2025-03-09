output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

# output "cluster_service_ipv4_cidr" {
 # description = "The cluster service CIDR for the EKS cluster"
 # value       = try(module.eks.cluster_service_cidr, null) # ✅ Correct way


# output "cluster_service_ipv4_cidr" {
  # description = "The cluster service IPv4 CIDR block"
  # value       = var.cluster_service_ipv4_cidr # ✅ This comes from the EKS module input


output "cluster_service_ipv4_cidr" {
  description = "The cluster service IPv4 CIDR block"
  value       = var.cluster_service_ipv4_cidr
}



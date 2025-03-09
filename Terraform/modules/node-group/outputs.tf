output "node_group_id" {
  description = "EKS Node Group ID"
  value       = module.eks_node_group.node_group_id
}

output "node_group_arn" {
  description = "EKS Node Group ARN"
  value       = module.eks_node_group.node_group_arn
}

output "node_group_status" {
  description = "EKS Node Group status"
  value       = module.eks_node_group.node_group_status
}

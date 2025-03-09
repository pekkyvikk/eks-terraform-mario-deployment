module "eks_node_group" {
  source            = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  cluster_name      = var.cluster_name
  cluster_version   = var.cluster_version
  subnet_ids        = var.subnet_ids
  name   = var.node_group_name
  instance_types    = var.instance_types
  min_size          = var.min_size
  max_size          = var.max_size
  capacity_type     = var.capacity_type
  desired_size      = var.desired_capacity 
  cluster_service_cidr = var.cluster_service_cidr
# cluster_service_ipv4_cidr = lookup(module.eks.eks_module_outputs, "cluster_service_cidr", null)
  tags = {
    Name        = "${var.cluster_name}-node-group"
    Environment = var.environment
  }
}


#locals {
 # cluster_service_cidr = var.cluster_service_ipv4_cidr


#locals {
  #cluster_service_cidr = coalesce(var.cluster_service_cidr, var.cluster_service_ipv4_cidr, "172.20.0.0/16")






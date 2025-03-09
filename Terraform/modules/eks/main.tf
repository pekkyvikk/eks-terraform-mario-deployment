module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.33.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true
  enable_cluster_creator_admin_permissions = true  # ✅ Grants admin access to the cluster creator

  cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr

  
  cluster_addons = {
    coredns = { resolve_conflicts = "OVERWRITE" }
    kube-proxy = { resolve_conflicts = "OVERWRITE" }
    vpc-cni = { resolve_conflicts = "OVERWRITE" }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}


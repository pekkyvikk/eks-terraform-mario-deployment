terraform {
  required_version = ">= 1.3.0" # Ensure compatibility with latest Terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "eks-mario-backend"
    key = "mario-backend/"
    encrypt = true
    dynamodb_table = "terraform-locks"
    region = "us-east-1"

    
    
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "k8s-use"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.eks_cluster_name
}



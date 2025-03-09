module "vpc" {
  source              = "./modules/vpc"
  project_name        = "my-k8s-project"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
}


module "eks" {
  source                    = "./modules/eks"
  cluster_name              = "my-eks-cluster"
  cluster_version           = "1.27"
  vpc_id                    = module.vpc.vpc_id
  subnet_ids                = module.vpc.public_subnet_ids
  environment               = "dev"
  cluster_service_ipv4_cidr = "172.20.0.0/16" # ✅ Make sure this is passed

 
}




module "node_group" {
  source           = "./modules/node-group"      # Ensure correct path
  cluster_name     = module.eks.eks_cluster_name # Corrected output name
  cluster_version  = "1.27"
  subnet_ids       = module.vpc.public_subnet_ids # Ensure this exists in module.vpc
  node_group_name  = "eks-node-group"
  instance_types   = ["t3.medium"]
  desired_capacity = 2
  min_size         = 1
  max_size         = 3
  capacity_type    = "ON_DEMAND"
  environment      = "dev"

  # ✅ Correctly pass extracted cluster_service_cidr
  # cluster_service_cidr = module.eks.cluster_service_ipv4_cidr  # (Now coming from eks/output.tf)
  cluster_service_cidr = module.eks.cluster_service_ipv4_cidr # ✅ The correct fix

}

module "bastion_host" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion-host"
  instance_type = "t3.micro"
  ami = "ami-05b10e08d247fb927"  # Replace with your preferred AMI
  key_name = "k8s-keypair"  # Replace with your SSH key name

  vpc_security_group_ids = [module.bastion_sg.security_group_id]  # ✅ Use the declared module
  subnet_id = module.vpc.public_subnet_ids[0]  # Place in public subnet

  associate_public_ip_address = true  # Ensure public access
}



module "eks_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "eks-cluster-sg"
  description = "EKS security group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = ["https-443-tcp"]  # Allow HTTPS access to API Server

  ingress_cidr_blocks = ["0.0.0.0/0"]  # Open to all (use your own restrictions)

  
}




module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = ["ssh-tcp"]  # Allow SSH access
  ingress_cidr_blocks = ["0.0.0.0/0"]  # Open to all (Restrict this in production)

  egress_rules = ["all-all"]  # Allow all outbound traffic
}


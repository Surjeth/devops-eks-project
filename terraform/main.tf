# main.tf (root level)

module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
}

module "iam" {
  source = "./modules/iam"
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "devops-eks-project-repo"
}


module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  subnet_ids         = module.vpc.subnet_ids          # All subnets (public + private)
  private_subnet_ids = module.vpc.private_subnet_ids  # Private subnets only
  cluster_role_arn   = module.iam.eks_cluster_role_arn
}
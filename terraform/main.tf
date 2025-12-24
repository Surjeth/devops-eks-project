module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
}

module "iam" {
  source = "./modules/iam"
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  subnet_ids         = module.vpc.private_subnets
  cluster_role_arn  = module.iam.eks_cluster_role_arn
  node_role_arn     = module.iam.eks_node_role_arn
}

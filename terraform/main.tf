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

  repository_name = "${var.project_name}-repo"
}

module "eks" {
  source = "./modules/eks"

  project_name        = var.project_name
  subnet_ids          = module.vpc.subnet_ids
  private_subnet_ids = module.vpc.private_subnet_id
  cluster_role_arn    = module.iam.eks_cluster_role_arn

  # 🔥 THIS MUST MATCH YOUR PIPELINE IAM USER
  admin_principal_arn = "arn:aws:iam::505679504503:user/deploy"
}

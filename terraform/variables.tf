variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "devops-eks-project"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "admin_principal_arn" {
  default = "arn:aws:iam::505679504503:user/deploy"
}
variable "admin_principal_arn" {
  description = "IAM principal allowed admin access to EKS"
  type        = string
}

variable "project_name" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "admin_principal_arn" {
  description = "IAM principal allowed to administer the EKS cluster"
  type        = string
}

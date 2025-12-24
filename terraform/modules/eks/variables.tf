variable "project_name" {}
variable "subnet_ids" {}
variable "cluster_role_arn" {}
variable "private_subnet_ids" {
  type = list(string)
}


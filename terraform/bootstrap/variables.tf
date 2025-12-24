variable "region" {
  default = "us-east-1"
}

variable "state_bucket_name" {
  description = "S3 bucket for Terraform state"
}

variable "lock_table_name" {
  description = "DynamoDB table for state locking"
}

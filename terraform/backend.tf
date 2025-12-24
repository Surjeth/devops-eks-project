terraform {
  backend "s3" {
    bucket         = "surjeth-devops-eks-tf-state-12345"
    key            = "devops-eks-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# DevOps EKS Project

End-to-end DevOps pipeline for deploying applications to AWS EKS using Terraform, Docker, and Kubernetes.

Project Structure

<img width="416" height="620" alt="image" src="https://github.com/user-attachments/assets/b1980acf-6705-4366-a677-2de5a3e62f4a" />


GitHub (Push to main)
        |
        v
GitHub Actions CI/CD
        |
        ├── Terraform (VPC, IAM, EKS, ECR)
        ├── Docker Build
        ├── Push Image to Amazon ECR
        ├── Configure kubectl
        └── Deploy to Amazon EKS
                |
                v
        Kubernetes Service (LoadBalancer)
                |
                v
            Public URL


## Project Structure

```
├── .github/workflows/    # CI/CD pipeline
├── app/                  # Application source code
├── docker/              # Docker configuration
├── k8s/                 # Kubernetes manifests
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── aws-auth.yaml
└── terraform/           # Infrastructure as Code
    ├── modules/
    │   ├── ecr/        # ECR repository
    │   ├── eks/        # EKS cluster
    │   ├── iam/        # IAM roles/policies
    │   └── vpc/        # VPC networking
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

## Prerequisites

- AWS Account with appropriate permissions
- Terraform >= 1.6.6
- Docker
- kubectl
- AWS CLI

## Required GitHub Secrets

Configure the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `AWS_ACCOUNT_ID`
- `TF_STATE_BUCKET`
- `TF_LOCK_TABLE`
- `EKS_CLUSTER_NAME`

## Infrastructure Components

- **VPC**: Custom VPC with public/private subnets
- **EKS**: Managed Kubernetes cluster
- **ECR**: Docker image registry
- **IAM**: Service roles and policies


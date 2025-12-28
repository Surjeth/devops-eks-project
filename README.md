# DevOps EKS Project

End-to-end DevOps pipeline for deploying applications to AWS EKS using Terraform, Docker, and Kubernetes.

## Project Flow
<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/ee5f5f72-bd49-4001-9a6f-b2c94c5fceff" />

```
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
```

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

## Deployment Pipeline

The GitHub Actions workflow automatically:

1. Provisions AWS infrastructure with Terraform
2. Creates EKS access entries for authentication
3. Builds Docker image
4. Pushes image to ECR
5. Deploys application to EKS
6. Verifies deployment


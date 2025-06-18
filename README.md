# Deploy-ML-Model-to-SageMaker

Deploy ML Model to SageMaker Using MLflow, Docker, Terraform & GitHub Actions (OIDC)

# Project Overview

This workflow automates the deployment of a machine learning model to AWS SageMaker using:

MLflow: For model tracking and packaging
Docker: For containerizing the model
Amazon ECR: For storing the Docker image
Amazon SageMaker: For hosting the model
Terraform: For infrastructure-as-code
GitHub Actions: For CI/CD automation
OIDC: For secure authentication to AWS from GitHub

# Model Training with MLflow
A simple ML model (e.g., Logistic Regression) is trained using scikit-learn.
The model is logged using MLflow to a local directory.

# Dockerization
A Dockerfile is created to serve the MLflow model using MLflow’s built-in REST API.

# Terraform Infrastructure
main.tf
Defines resources for:

ECR repository
SageMaker model

# variables.tf

Defines input variables:

variable "aws_region" {}
variable "sagemaker_role_arn" {}
variable "ecr_image_uri" {}

# outputs.tf

Outputs useful values:
output "sagemaker_model_name" {
  value = aws_sagemaker_model.ml_model.name
}


# GitHub Actions with OIDC

## Why OIDC?

Secure, short-lived credentials
No need to store AWS secrets in GitHub
IAM Role for GitHub OIDC
Create a role with trust policy for GitHub

# GitHub Actions Workflow (deploy.yml)

Automates:

Docker build and push to ECR
Terraform apply to deploy SageMaker model


# Final Outcome

After this workflow runs:

The ML model is containerized and pushed to ECR.
Terraform provisions a SageMaker model using the image.
SageMaker is ready to serve predictions via endpoint (if configured)
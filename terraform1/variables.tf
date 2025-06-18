variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "sagemaker_role_arn" {
  description = "IAM role ARN for SageMaker execution"
  type        = string
  default     = "arn:aws:iam::921666318654:role/SageMakerExecutionRole"
}

variable "ecr_image_uri" {
  description = "URI of the Docker image in ECR"
  type        = string
}
output "sagemaker_model_name" {
  description = "Name of the deployed SageMaker model"
  value       = aws_sagemaker_model.ml_model.name
}
output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.mlflow_model.repository_url
}
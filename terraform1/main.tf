provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "mlflow_model" {
  name = "mlflow-model"
}

resource "aws_sagemaker_model" "ml_model" {
  name               = "mlflow-model"
  execution_role_arn = var.sagemaker_role_arn

  primary_container {
    image          = "921666318654.dkr.ecr.us-east-1.amazonaws.com/myapp-repo"
    model_data_url = "s3://abhi100bucket1211/upload/model.tar.gz"
  }
}
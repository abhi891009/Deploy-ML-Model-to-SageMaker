provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "mlflow_model" {
  name = "mlflow-model2"
}

resource "aws_sagemaker_model" "ml_model" {
  name               = "mlflow-model2"
  execution_role_arn = var.sagemaker_role_arn

  lifecycle {
    prevent_destroy = false
    ignore_changes = all
  }

  primary_container {
    image          = "921666318654.dkr.ecr.us-east-1.amazonaws.com/myapp-repo"
    model_data_url = "s3://abhi100bucket1211/upload/model.tar.gz"
  }
}

# 2. SageMaker Endpoint Configuration
# This resource defines the compute instances (e.g., ml.t2.medium) that will host your model.

resource "aws_sagemaker_endpoint_configuration" "ml_endpoint_config" {
  name = "${aws_sagemaker_model.ml_model.name}-config" # Naming convention: model-name-config

  production_variants {
    variant_name           = "ml-variant"
    model_name             = aws_sagemaker_model.ml_model.name
    initial_instance_count = 1                          
    instance_type          = "ml.t2.medium"             
    initial_variant_weight = 1
  }

  # Add tags if we want them on this resource
  tags = {
    Project = "MLFlowDeployment"
  }
}


# This resource creates the actual HTTP endpoint that our application will call for predictions.
resource "aws_sagemaker_endpoint" "ml_endpoint" {
  name                = "${aws_sagemaker_model.ml_model.name}-endpoint"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.ml_endpoint_config.name

  tags = {
    Project = "MLFlowDeployment"
}
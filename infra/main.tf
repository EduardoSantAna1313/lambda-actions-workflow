locals {
  role_name = "${var.function_name}-role"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name  = var.function_name
  description    = var.function_description
  handler        = var.handler
  runtime        = var.function_runtime
  create_package = false
  create_role    = false
  lambda_role = aws_iam_role.this.arn

  s3_existing_package = {
    bucket = var.bucket_source_code
    key    = var.code_key
  }

  tags = {
    Name     = var.function_name
    Pipeline = "Github Actions"
  }

  depends_on = [aws_iam_role.this]
}
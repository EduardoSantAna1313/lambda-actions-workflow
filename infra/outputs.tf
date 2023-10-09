output "lambda_arn" {
  value = module.lambda_function.lambda_function_arn
}

output "policy_arn" {
  value = aws_iam_policy.this.arn
}

output "role_arn" {
  value = aws_iam_role.this.arn
}

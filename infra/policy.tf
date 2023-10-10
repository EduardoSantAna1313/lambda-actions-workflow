data "aws_caller_identity" "this"{}


resource "aws_iam_policy" "this" {
  name   = "${local.role_name}-policy"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
  {
      "Effect": "Allow",
      "Action": [
          "s3:*",
          "s3-object-lambda:*"
      ],
      "Resource": "*"
  },
  {
      "Effect": "Allow",
      "Action": [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Resource": [
          "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.this.account_id}:log-group:/aws/lambda/${var.function_name}:*"
      ]
  },
  {
    "Effect": "Allow",
    "Action": "logs:CreateLogGroup",
    "Resource": "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.this.account_id}:*"
    }
]
}
POLICY
}
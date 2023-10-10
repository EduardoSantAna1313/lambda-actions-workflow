### AWS ###
variable "aws_region" {
  description = "AWS region"
  default     = "sa-east-1"
  type        = string
}

### Lambda ###

variable "function_name" {
  description = "Nome da função lambda"
  type        = string
}

variable "function_description" {
  description = "Descrição da AWS Lambda"
  type        = string
}

variable "function_runtime" {
  description = "Runtime da função"
  type        = string
}

variable "function_timeout" {
  description = "TImeout da função"
  type        = number
  default     = 120
}

variable "handler" {
  description = "handler file"
  default     = "index.handler"
}

variable "bucket_source_code" {
  description = "Bucket for the source code"
  type        = string
}

variable "code_key" {
  description = "Code key on S3"
  type        = string
}

function_name        = "lambda-actions-workflow"
function_description = "Lambda com pipeline do github actions"
function_runtime     = "nodejs18.x"
function_timeout     = 3
handler              = "index.handler"

# SETADAS PELA PIPELINE
# aws_region     = "sa-east-1"
# bucket_source_code   = "bucket"
# code_key             = "lambda.zip"
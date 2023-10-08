### AWS ###
aws_account_id = "329158668427"
aws_region     = "sa-east-1"

### Lambda ###
function_name        = "lambda-actions-workflow"
function_description = "Lambda com pipeline do github actions"
function_runtime     = "nodejs18.x"
function_timeout     = 3
handler              = "index.handler"
# Recuperar code_key pelo workflows
#bucket_source_code   = "bucket"
# code_key             = "lambda.zip"
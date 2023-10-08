### AWS ###
aws_account_id = "329158668427"
aws_region     = "sa-east-1"

### Lambda ###
function_name        = "lambda-actions-workflow"
function_description = "Lambda com pipeline do github actions"
function_runtime     = "nodejs18.x"
function_timeout     = 3
handler              = "index.handler"
bucket_source_code   = "bucket-cache-artifacts"
# Recuperar code_key pelo workflows
# code_key             = "lambda-actions-workflow-502c099594b556921a8f34cf7e4443b0.zip"
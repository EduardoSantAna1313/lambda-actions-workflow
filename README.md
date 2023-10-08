# lambda-actions-workflow
Exemplo de AWS Lambda com github actions para workflow de CICD.
Realiza build do código, upload para bucket s3, e provisiona infraestrutura usando terraform.

## Pipeline

A pipe starta com push para a branch `develop`.

Rodará 2 jobs:
- build
     - Realiza build do código *node* dentro da pasta `app`.
- terraform
    - Cria infraestrutura a partir de código terraform da pasta `infra`.
    - Cria arquivo de `backend` automaticamente para salvar `tfstate` em um bucket S3.

### Variaveis de ambiente

A pipeline possui as seguintes variaveis de ambiente:

-  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
-  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
-  AWS_ACCOUNT_ID: ${{ vars.AWS_ACCOUNT_ID }}
-  AWS_REGION: ${{ vars.AWS_REGION }}
-  LAMBDA_NAME: lambda
-  BUCKET_CODE: ${{ vars.BUCKET_CODE }}
-  BUCKET_STATE: ${{ vars.BUCKET_STATE }}

Todas as variáveis e secrets devem ser configuradas no repositório no GitHub.
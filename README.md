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

- AWS_REGION: Região AWS.
- AWS_ASSUME_ROLE: ARN da role para execução da esteira.
- BUCKET_CODE: Bucket onde o código será salvo.
- BUCKET_STATE: Bucket que servirá como Backend para o terraform. Irá armazenar os arquivos de estado (terraform.tfstate) da infra.

Todas as variáveis e secrets devem ser configuradas no repositório no GitHub.


## Workflow role

Para poder executar o provisionamento da infraestrutura na AWS é realizado assumeRoleWithWebIdentity para gerar credenciais provisórias para execução da pipeline.

É necessário criar um OIDC Provider na Conta AWS:

- URL: `token.actions.githubusercontent.com` 
- Audience: `sts.amazonaws.com`

Em seguida criar IAM Role com a seguinte Trusted entities:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::{account_id}:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.GitHubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.GitHubusercontent.com:sub": "repo:{org_github}/{repositorio}:{branch}"
                }
            }
        }
    ]
}
```

Definir as permissões adequadas para role, como permissão para criar Buckets, lambda, etc.

Na pipeline basta configurar o ARN da role no parametro `role-to-assume`, desta forma não é necessário passar as credenciais diretamente.

```yaml
- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v3
  with:
    role-to-assume: ${{ env.AWS_ASSUME_ROLE }}
    aws-region: ${{ env.AWS_REGION }}
    role-session-name: github_actions_oidc_role
```

Para mais informações: 
[Configuring OpenID Connect in AWS](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
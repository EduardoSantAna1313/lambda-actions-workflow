cd ../infra

echo "Terraform init"

terraform init

echo "Terraform validate"

terraform validate

echo "Terraform apply"

terraform apply
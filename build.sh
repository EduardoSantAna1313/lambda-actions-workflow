BUCKET_NAME=bucket-cache-artifacts
REGION=sa-east-1
LAMBDA_NAME=lambda-actions-workflow

rm -r $LAMBDA_NAME*.zip   

cd app/

printf "\n\n### Building the code ###\n\n"

npm install

printf "\n\n### Packing the code ###\n\n"

zip a ../$LAMBDA_NAME.zip -r ../app/*

cd ..

printf "\n\n### Creating HASH ###\n\n"

HASH=$(md5sum $LAMBDA_NAME.zip | awk '{print $1}')
FILE_NAME="$LAMBDA_NAME-$HASH.zip"
echo $FILE_NAME

mv $LAMBDA_NAME.zip $FILE_NAME

printf "\n\n### Upload zip ###\n"

aws s3 cp $FILE_NAME s3://$BUCKET_NAME/

cd ../infra

# terraform init

terraform fmt -recursive

terraform plan

terraform apply -auto-approve